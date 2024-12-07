test_that("with a bad url returns FALSE", {
  url <- "bad"
  expect_equal(yields_successful_request(url), FALSE)
})

test_that("with a 404 url returns FALSE", {
  skip_if_offline()
  url <- "https://www.google.com/not/found"
  expect_equal(yields_successful_request(url), FALSE)
})

test_that("with a good url returns FALSE", {
  skip_if_offline()
  url <- "https://www.google.com/"
  expect_equal(yields_successful_request(url), TRUE)
})
