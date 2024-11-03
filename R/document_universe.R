reference_any <- function(doc) {
  force(doc)
  function(x, url_template = NULL, url = NULL, packages = NULL, strip_s3class = TRUE) {
    warn_unnattached(x, doc)
    pick <- pick_doc(packages = packages, doc = doc, x = x)

    result <- tidy_reference(may_add_url(pick, url), strip_s3class)

    if (!is.null(url_template)) {
      result <- mutate(result, topic = paste0("<a href=", glue::glue(url_template), ">", .data$topic, "</a>"))
    }

    result
  }
}

document_universe_impl <- reference_any("package")


#' Create a data frame with documentation metadata of one or more packages
#'
#' Create a data.frame with documentation metadata of one or more packages. If
#' you develop a universe, such as the tidyverse or tidymodels, dverse helps you
#' to easily create a universe-wide reference for the pkgdown website of your
#' meta-package.
#'
#' @param x A character vector giving concepts or package names to match.
#' @param url_template Character. A template to generate links to documentation
#'   based on the column names of the output -- typically `package` and `topic`,
#'   e.g. `"https://maurolepore.github.io/{package}/reference/{topic}.html"`
#'   (`glue::glue()` syntax).
#'
#' @return A data frame.
#'
#' @export
#' @examples
#' document_universe("datasets")
document_universe <- function(x, url_template = NULL) {
  # TODO Refactor to simplify. Comes from the more complex maurolepore/pkgdoc
  out <- document_universe_impl(x = x, url_template = url_template)
  tibble::as_tibble(out)
}

warn_unnattached <- function(x, doc) {
  if (!identical(doc, "package")) {
    return(invisible(x))
  }

  if (!all(attached(x))) {
    unattached <- x[!attached(x)]
    cli::cli_warn(c(
      "All packages should be attached to work properly.",
      x = "Not attached: {unattached}"
    ))
  }
}

pick_doc <- function(packages, doc, x) {
  result <- search_documentation(packages = packages)
  result <- exclude_package_doc(result, packages)
  result <- exclude_internal_functions(result)
  result <- select(result, -"libpath", -"id", -"encoding", -"name")
  result <- unique(result)
  result <- filter(result, result[[doc]] %in% x)

  abort_missing_doc(result, doc, x)
  result
}

tidy_reference <- function(data, strip_s3class) {
  out <- collapse_alias(data, strip_s3class)
  out <- select(out, c("topic", "alias", "title", "concept", "package"))
  out <- arrange(out, .data$alias)
  out
}

exclude_package_doc <- function(data, packages) {
  if (is.null(packages)) {
    return(data)
  }

  filter(data, !.data$alias %in% c(packages, glue("{package}-package")))
}

exclude_internal_functions <- function(data) {
  filter(data, !.data$keyword %in% "internal")
}

attached <- function(x) {
  unlist(lapply(glue("package:{x}"), rlang::is_attached))
}

abort_missing_doc <- function(.data, doc, x) {
  good_request <- x %in% unique(.data[[doc]])
  if (all(good_request)) {
    return(invisible(.data))
  }

  bad_request <- x[!good_request]
  cli::cli_abort("No {doc} matches '{bad_request}'.")
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

may_add_url <- function(x, url) {
  if (is.null(url)) {
    return(unique(x))
  }
  unique(link_topic(x, url))
}

link_topic <- function(data, url) {
  out <- mutate(
    data,
    topic   = glue("<a href={url}{package}/reference/{topic}>?</a>"),
    package = glue("<a href={url}{package}>{package}</a>")
  )

  arrange(out, .data$package)
}
