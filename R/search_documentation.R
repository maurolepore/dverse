search_documentation <- function() {
  docs <- suppressMessages(
    Reduce(dplyr::full_join, utils::hsearch_db())
  )

  out <- set_names(docs, tolower)
  out <- as_tibble(out)
  out
}
