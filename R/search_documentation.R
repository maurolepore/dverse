search_documentation <- function() {
  docs <- suppressMessages(
    Reduce(full_join, hsearch_db())
  )

  out <- set_names(docs, tolower)
  out <- as_tibble(out)
  out
}
