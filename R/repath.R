#' JJF repath function
#'
#' Converts the backslash to fowardslash (or vice versa?)
#' @keywords repath
#' @export
#'

repath <- function() {
   cat('Paste windows file path and hit RETURN twice')
   x <- scan(what = "")
   xa <- gsub('\\\\', '/', x)
   utils::writeClipboard(paste(xa, collapse = " "))
   cat('Here\'s your de-windowsified path. (It\'s also on the clipboard.)\n', xa, '\n')
 }
