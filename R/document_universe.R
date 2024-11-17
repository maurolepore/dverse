document_universe_impl <- function(x, url_template = NULL) {
  warn_unnattached(x)
  pick <- pick_doc(x)

  out <- tidy_reference(may_add_url(pick, url = NULL), strip_s3class = TRUE)

  if (!is.null(url_template)) {
    out <- mutate(out, topic = paste0("<a href=", glue::glue(url_template), ">", .data$topic, "</a>"))
  }

  out
}


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

warn_unnattached <- function(x, doc = "package") {
  if (!all(attached(x))) {
    unattached <- x[!attached(x)]
    cli::cli_warn(c(
      "All packages should be attached to work properly.",
      x = "Not attached: {unattached}"
    ))
  }
}

pick_doc <- function(x) {
  out <- search_documentation()
  out <- exclude_internal_functions(out)
  out <- select(out, -"libpath", -"id", -"encoding", -"name")
  out <- unique(out)
  out <- filter(out, out[["package"]] %in% x)

  abort_unavailable_package(out, x)
  out
}

tidy_reference <- function(data, strip_s3class) {
  out <- collapse_alias(data, strip_s3class)
  out <- select(out, c("topic", "alias", "title", "concept", "type", "package"))
  out <- arrange(out, .data$alias)
  out
}

exclude_internal_functions <- function(data) {
  filter(data, !.data$keyword %in% "internal")
}

attached <- function(x) {
  unlist(lapply(glue("package:{x}"), rlang::is_attached))
}

abort_unavailable_package <- function(data, x) {
  is_available <- x %in% unique(data[["package"]])
  if (all(is_available)) {
    return(invisible(data))
  }

  is_unavailable <- x[!is_available]
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
