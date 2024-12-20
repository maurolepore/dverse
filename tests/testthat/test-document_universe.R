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

  cols <- c("topic", "alias", "title", "concept", "type", "keyword", "package")
  expect_named(out, cols)

  are_type <- unlist(unique(lapply(out, typeof)))
  expect_equal(are_type, "character")
})

test_that("works with multiple packages", {
  packages <- c("datasets", "grDevices")
  out <- document_universe(packages)
  expect_true(setequal(out$package, packages))
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
  out <- document_universe("datasets", url = "https://blah")
  topic <- out[out$type == "help", "topic"]$topic
  expect_true(all(grepl("href", topic)))
})

test_that("strips the class of S3 methods", {
  out <- document_universe("base")
  alias <- unique(out[grepl("all.equal", out$alias), "alias"])[[1]]
  expect_false(grepl("numeric", alias))
})

test_that("includes the package-level documentation", {
  out <- document_universe("dverse")
  expect_true(any(grepl("dverse-package", unique(out$alias))))
})

test_that("includes exported but internal functions", {
  out <- document_universe("dverse")
  expect_true("internal" %in% out$keyword)
})

test_that("takes a `url_template`", {
  template <- "https://maurolepore.github.io/{package}/reference/{topic}.html"
  out <- document_universe("dverse", url_template = template)
  expect_true(grepl("dverse", out$topic[[1]]))
})

test_that("with bad `url_template` errors gracefully", {
  skip_if_offline()

  bad <- "https://{bad}/{topic}.html"
  expect_error(document_universe("dverse", url_template = bad), "not found")
})

test_that("vignettes have a reachable link", {
  skip_if_offline()
  withr::local_package("tibble")

  template <- "https://{package}.tidyverse.org/reference/{topic}.html"
  out <- document_universe("tibble", url_template = template)
  topic <- out[out$type == "vignette", ]$topic
  topic <- head(topic)

  # Errors if there is no vignette
  expect_false(rlang::is_empty(topic))

  expect_true(all(is_online(topic)))
})

test_that("a r-universe template yields the expected vignette topic", {
  skip_if_offline()
  withr::local_package("tibble")

  template <- c(
    manual = "https://tidyverse.r-universe.dev/{package}/doc/manual.html#{topic}",
    articles = "https://tidyverse.r-universe.dev/articles/{package}/{topic}.html"
  )
  out <- document_universe("tibble", url_template = template)
  url <- extract_url(out[grep("extending", out$topic), ]$topic)

  expected <- "https://tidyverse.r-universe.dev/articles/tibble/extending.html"
  expect_equal(url, expected)
  expect_true(is_online(url))
})

test_that("with url_template longer than 2 yields an error", {
  too_long <- c("a", "b", "c")
  expect_snapshot(error = TRUE, document_universe("base", too_long))
})
