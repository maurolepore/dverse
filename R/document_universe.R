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
      cli_abort("`url_template` must be of length 1 or 2, not {longer}.")
    }


    out <- mutate(
      out,
      topic = case_when(
        .data$type == "help" ~ to_href(
          .data$topic,
          template = glue(manual)
        ),
        .data$type == "vignette" ~ to_href(
          .data$topic,
          template = glue(vignettes_template(vignettes))
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
#'   The template may have lengh 1 or 2:
#'   * If the template is a vector has length 1, the template should point to the
#'   manual (a.k.a. "reference" or "index"), i.e. the online version of the help
#'   files that you can otherwise access locally with `?`, e.g.:
#'   ```r
#'   "https://{package}.tidyverse.org/reference/{topic}.html"
#'   ```
#'   In this case, the template for vignettes is automatically constructed by
#'   replacing `/reference/` with `/articles/`, e.g.:
#'   ```r
#'   "https://{package}.tidyverse.org/articles/{topic}.html"
#'   ```
#'   If this is invalid, then you'll need to provide a vector of length 2.
#'   * If the template is a vector has length 2, the first element should point to the manual
#'   (see above), and the second element should point to vignettes, e.g.:
#'   ```r
#'   c(
#'    "https://{package}.tidyverse.org/reference/{topic}.html",
#'    "https://{package}.tidyverse.org/articles/{topic}.html"
#'   )
#'   ```
#' @return A data frame.
#'
#' @export
#' @examples
#' # Pretend this is the universe we want to document
#' library(glue)
#' library(tibble)
#'
#' universe <- c("glue", "tibble")
#'
#' document_universe(universe)
#'
#' # Adding links the online manual and vignettes
#' template <- "https://{package}.tidyverse.org/reference/{topic}.html"
#' document_universe(universe, template)
#'
#' # Adding an explicit template for vignettes
#' template <- c(
#'  "https://{package}.tidyverse.org/reference/{topic}.html",
#'  "https://{package}.tidyverse.org/articles/{topic}.html"
#' )
#' document_universe(universe, template)
#'
#' # Works beyond GitHub Pages, e.g. on r-universe
#' template <- c(
#'   "https://tidyverse.r-universe.dev/{package}/doc/manual.html#{topic}",
#'   "https://tidyverse.r-universe.dev/articles/{package}/{topic}.html"
#' )
#' document_universe(universe, template)
document_universe <- function(x, url_template = NULL) {
  out <- document_universe_impl(x = x, url_template = url_template)
  as_tibble(out)
}

warn_unnattached <- function(x, doc = "package") {
  if (!all(attached(x))) {
    unattached <- x[!attached(x)] # nolint
    cli_warn(c(
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
  unlist(lapply(glue("package:{x}"), is_attached))
}

abort_unavailable_package <- function(data, x) {
  is_available <- x %in% unique(data[["package"]])
  if (all(is_available)) {
    return(invisible(data))
  }

  is_unavailable <- x[!is_available] # nolint
  cli_abort("No pacakge matches '{is_unavailable}'.")
}

collapse_alias <- function(data, strip_s3class = FALSE) {
  out <- mutate(
    data,
    alias = case_when(
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
