s3_strip_class <- function(x) {
  unlist(lapply(x, s3_strip_class_impl))
}

s3_strip_class_impl <- function(x) {
  if (!is_s3_method(x)) {
    return(x)
  }

  f_c <- strsplit(x, ".", fixed = TRUE)[[1]]
  nfc <- length(f_c)

  if (nfc == 2) {
    return(f_c[[1L]])
  }

  ok <- logical(nfc)
  for (j in 2:nfc) {
    ok[[j]] <- utils::isS3method(
      f = paste(f_c[1:(j - 1)], collapse = "."),
      class = paste(f_c[j:nfc], collapse = ".")
    )
  }

  .f <- character(nfc)
  for (j in 2:nfc) {
    .f[[j]] <- paste(f_c[1:(j - 1)], collapse = ".")
  }

  .f[which(ok)]
}

is_s3_method <- function(x) {
  ifelse(startsWith(x, "."), FALSE, utils::isS3method(x))
}
