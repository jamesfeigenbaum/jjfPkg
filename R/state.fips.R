#' @title State FIPS look up
#'
#' @description  Simple vector to use like state.abb or state.name
#' from the base datasets
#' This has fips codes for states
#'
#' @docType data
#'
#' @usage data(state.fips)
#'
#' @format An object of class \code{"vector"}
#'
#' @keywords datasets
#'
#' @source \href{https://gist.github.com/soodoku/f9e18efe98f7d74931d8b4a79a49e6f5}{Sooduko}
#'
#' @examples
#' data(state.fips)
#' x <- c("New York", "Virginia")
#' state.fips[match(x, state.name)]
"state.fips"
