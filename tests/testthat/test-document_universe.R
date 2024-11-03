test_that("errors if the package does not exist", {
  # Not ideal but also warns that the package isn't attached.
  expect_warning(
    expect_error(document_universe("bad"), "bad"),
    "should be attached"
  )
})

test_that("yields the expected tbl", {
  out <- document_universe(c("datasets"))

  expect_s3_class(out, "tbl")
  expect_named(out, c("topic", "alias", "title", "concept", "package"))
  are_type <- unlist(unique(lapply(out, typeof)))
  expect_equal(are_type, "character")
})

test_that("works with multiple packages", {
  out <- document_universe(c("datasets", "grDevices"))
  expect_equal(unique(out$package), c("datasets", "grDevices"))
})

test_that("warns if a package isn't attached", {
  packages <- c("tools", "datasets")
  expect_warning(document_universe(packages), "Not attached.*tools")
})

test_that("with no url creates no link", {
  out <- document_universe("datasets")$topic[[1]]
  expect_false(grepl("href", out))
})

test_that("with a url creates a link", {
  out <- document_universe("datasets", url = "https://blah")$topic[[1]]
  expect_true(grepl("href", out))
})

test_that("srips the class of S3 methods", {
  out <- document_universe("base")
  alias <- unique(out[grepl("all.equal", out$alias), "alias"])[[1]]
  expect_false(grepl("numeric", alias))
})

test_that("doesn't include the package-level documentation", {
  out <- document_universe("dverse")
  expect_false(any(grepl("dverse-package", unique(out$alias))))
})

test_that("takes a `url_template`", {
  url_template <- "https://maurolepore.github.io/{package}/reference/{topic}.html"
  out <- document_universe("dverse", url_template = url_template)
  expect_true(grepl("dverse", out$topic[[1]]))
})

test_that("with bad `url_template` errors gracefully", {
  bad <- "https://{bad}/{topic}.html"
  expect_error(document_universe("dverse", url_template = bad), "not found")
})
