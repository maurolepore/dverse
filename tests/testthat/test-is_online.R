test_that("with a bad url returns FALSE", {
  url <- "bad"
  expect_false(is_online(url))
})

test_that("with a 404 url returns FALSE", {
  skip_if_offline()
  url <- "https://www.google.com/not/found"
  expect_false(is_online(url))
})

test_that("with a good url returns TRUE", {
  skip_if_offline()
  url <- "https://example.com/"
  expect_true(is_online(url))
})

test_that("works with href and bare url", {
  skip_if_offline()
  url <- c(
    "https://example.com",
    "<a href=https://example.com>example</a>",
    "<a href=https://example.com/bad>bad</a>",
    "bad"
  )
  expect_equal(is_online(url), c(TRUE, TRUE, FALSE, FALSE))
})
