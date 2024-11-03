#' Dataframe the documentation of installed packages.
#'
#' This is fundamentally a data frame version of the output of
#' [utils::hsearch_db()].
#'
#' @examples
#' library(datasets)
#' library(tools)
#'
#' search_documentation(c("datasets", "tools"))
#' @noRd
search_documentation <- function(packages = NULL) {
  docs <- suppressMessages(
    Reduce(dplyr::full_join, utils::hsearch_db())
  )

  result <- set_names(docs, tolower)

  if (is.null(packages)) {
    return(result)
  }

  result <- filter(result, .data$package %in% packages)
  as_tibble(result)
}
