#' @title State ICPSR look up
#'
#' @description  Simple vector to use like state.abb or state.name
#' from the base datasets
#' This has icpsr codes
#'
#' @docType data
#'
#' @usage data(state.icpsr)
#'
#' @format An object of class \code{"vector"}
#'
#' @keywords datasets
#'
#' @source \href{https://gist.github.com/soodoku/4c6bbf529fab6ec0bc3576e829af7c5d}{Sooduko}
#'
#' @examples
#' data(state.icpsr)
#' x <- c("New York", "Virginia")
#' state.icpsr[match(x, state.name)]
"state.icpsr"
