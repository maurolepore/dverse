#' Strip the class part of attached S3 methods (do nothing with other functions).
#'
#' @param x A character vector giving candidate S3 methods.
#' @seealso utils::isS3method()
#'
#' @return Character.
#'
#' @examples
#' s3_strip_class(c("print", "print.factor", "print.data.frame"))
#'
#' @noRd
s3_strip_class <- function(x) {
  unlist(lapply(x, s3_strip_class_impl))
}

s3_strip_class_impl <- function(x) {
  if (!is_s3_method(x)) {
    return(x)
  }

  f.c <- strsplit(x, ".", fixed = TRUE)[[1]]
  nfc <- length(f.c)

  if (nfc == 2) {
    return(f.c[[1L]])
  }

  ok <- logical(nfc)
  for (j in 2:nfc) {
    ok[[j]] <- utils::isS3method(
      f = paste(f.c[1:(j - 1)], collapse = "."),
      class = paste(f.c[j:nfc], collapse = ".")
    )
  }

  .f <- character(nfc)
  for (j in 2:nfc) {
    .f[[j]] <- paste(f.c[1:(j - 1)], collapse = ".")
  }

  .f[which(ok)]
}

is_s3_method <- function(x) {
  # Deal with objects starting with ".", e.g. .this
  withCallingHandlers(utils::isS3method(x), error = ~FALSE)
}
