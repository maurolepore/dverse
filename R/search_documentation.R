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
