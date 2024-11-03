test_that("returns the expected data structure", {
  cols <- c(
    "package",
    "libpath",
    "id",
    "name",
    "title",
    "topic",
    "encoding",
    "type",
    "alias",
    "keyword",
    "concept"
  )
  expect_named(
    result <- search_documentation(), cols
  )
  expect_true(length(unique(result$package)) > 1)
  expect_s3_class(result, "data.frame")
})

test_that("can pick specific packages", {
  expect_length(unique(search_documentation(c("base", "utils"))$package), 2)
})
