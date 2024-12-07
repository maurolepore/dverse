#' Is each URL (or href) online?
#'
#' @param x String.
#'
#' @return A logical vector.
#' @export
#'
#' @examples
#' url <- c(
#'   "https://example.com",
#'   "<a href=https://example.com>example</a>",
#'   "<a href=https://example.com/bad>bad</a>",
#'   "bad"
#' )
#'
#' is_online(url)
is_online <- function(x) {
  url <- extract_url(x)
  unlist(lapply(url, is_online_once))
}

is_online_once <- function(url) {
  tryCatch(error = function(e) FALSE, {
    response <- curl::curl_fetch_memory(url, handle = curl::new_handle())
    identical(response$status_code, 200L)
  })
}

extract_url <- function(x) {
  gsub(".*href=([^ '>]+).*", "\\1", x)
}
