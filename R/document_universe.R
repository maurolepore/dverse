document_universe_impl <- function(x, url_template = NULL) {
  warn_unnattached(x)
  pick <- pick_doc(x)

  out <- tidy_reference(pick, strip_s3class = TRUE)

  if (!is.null(url_template)) {
    manual <- url_template[[1]]

    if (identical(length(url_template), 1L)) {
      vignettes <- url_template[[1]]
    }
    if (identical(length(url_template), 2L)) {
      vignettes <- url_template[[2]]
    }
    if (length(url_template) > 2L) {
      longer <- length(url_template)
      cli::cli_abort("`url_template` must be of length 1 or 2, not {longer}.")
    }


    out <- mutate(
      out,
      topic = dplyr::case_when(
        .data$type == "help" ~ to_href(
          .data$topic,
          template = glue::glue(manual)
        ),
        .data$type == "vignette" ~ to_href(
          .data$topic,
          template = glue::glue(vignettes_template(vignettes))
        ),
        .default = .data$topic
      )
    )
  }

  out
}

to_href <- function(url, template) {
  paste0("<a href=", template, ">", url, "</a>")
}

vignettes_template <- function(template) {
  gsub("/reference/", "/articles/", template)
}

#' Create a data frame with documentation metadata of one or more packages
#'
#' Create a data.frame with documentation metadata of one or more packages. If
#' you develop a universe, such as the tidyverse or tidymodels, dverse helps you
#' to easily create a universe-wide reference for the pkgdown website of your
#' meta-package.
#'
#' @param x A character vector giving concepts or package names to match.
#' @param url_template Character. A template to generate links to documentation,
#'   using the syntax of `glue::glue()` to indicate where to insert the values
#'   from the columns `package` and `topic`.
#'   * If the vector has length 1, we assume it's for the manual (i.e. what you
#'   can access with `?`), e.g.:
#'   `"https://maurolepore.github.io/{package}/reference/{topic}.html"`. The
#'   template for vignettes will be automatically constructed by replacing
#'   /reference/ with /articles/, e.g.
#'   `"https://maurolepore.github.io/{package}/articles/{topic}.html"`. If this
#'   is invalid, then you'll need to provide a vector of length 2.
#'   * If the vector has length 2, we assume the first element is for the
#'   manual and the second element is for vignettes.
#'
#' @return A data frame.
#'
#' @export
#' @examples
#' library(glue)
#' library(tibble)
#'
#' packages <- c("glue", "tibble")
#' document_universe(packages)
#'
#' # Assuming vignettes can be found at */articles/* rather than */reference/*
#' manual <- "https://{package}.tidyverse.org/reference/{topic}.html"
#' document_universe(packages, url_template = manual)
#'
#' # Adding an explicit template for vignettes
#' vignettes <- "https://{package}.tidyverse.org/articles/{topic}.html"
#' document_universe(packages, url_template = c(manual, vignettes))
document_universe <- function(x, url_template = NULL) {
  out <- document_universe_impl(x = x, url_template = url_template)
  tibble::as_tibble(out)
}

warn_unnattached <- function(x, doc = "package") {
  if (!all(attached(x))) {
    unattached <- x[!attached(x)] # nolint
    cli::cli_warn(c(
      "All packages should be attached to work properly.",
      x = "Not attached: {unattached}"
    ))
  }
}

pick_doc <- function(x) {
  out <- search_documentation()
  out <- select(out, -"libpath", -"id", -"encoding", -"name")
  out <- unique(out)
  out <- filter(out, out[["package"]] %in% x)

  abort_unavailable_package(out, x)
  out
}

tidy_reference <- function(data, strip_s3class) {
  out <- collapse_alias(data, strip_s3class)
  out <- select(
    out,
    c("topic", "alias", "title", "concept", "type", "keyword", "package")
  )
  out <- arrange(out, .data$alias)
  out
}

attached <- function(x) {
  unlist(lapply(glue("package:{x}"), rlang::is_attached))
}

abort_unavailable_package <- function(data, x) {
  is_available <- x %in% unique(data[["package"]])
  if (all(is_available)) {
    return(invisible(data))
  }

  is_unavailable <- x[!is_available] # nolint
  cli::cli_abort("No pacakge matches '{is_unavailable}'.")
}

collapse_alias <- function(data, strip_s3class = FALSE) {
  out <- mutate(
    data,
    alias = dplyr::case_when(
      !strip_s3class ~ may_strip_s3class(.data$alias, .f = identity),
      strip_s3class ~ may_strip_s3class(.data$alias, .f = s3_strip_class),
    ),
    .by = "topic"
  )

  unique(out)
}

may_strip_s3class <- function(x, .f = s3_strip_class) {
  paste(unique(.f(x)), collapse = ", ")
}
