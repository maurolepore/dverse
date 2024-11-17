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
  expect_named(out <- search_documentation(), cols)
  expect_true(length(unique(out$package)) > 1)
  expect_s3_class(out, "data.frame")
})
