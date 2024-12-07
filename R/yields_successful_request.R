#' Does a URL yield a successful response?
#'
#' @param url A string.
#'
#' @return Logical.
#'
#' @examples
#' yields_successful_request("bad")
#' yields_successful_request("https://www.google.com/")
#' yields_successful_request("https://www.google.com/404")
#' @noRd
yields_successful_request <- function(url) {
  unlist(lapply(url, yields_successful_request_impl))
}

yields_successful_request_impl <- function(url) {
  tryCatch(is_succesful_request(url), error = function(e) FALSE)
}

is_succesful_request <- function(url) {
  req <- httr2::req_error(httr2::request(url), is_error = \(resp) FALSE)
  resp <- httr2::req_perform(req)
  identical(httr2::resp_status(resp), 200L)
}
