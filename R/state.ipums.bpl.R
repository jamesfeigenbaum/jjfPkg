#' @title State IPUMS BPL look up
#'
#' @description  Simple vector to use like state.abb or state.name
#' from the base datasets
#' This has bpl codes from ipums
#'
#' @docType data
#'
#' @usage data(state.ipums.bpl)
#'
#' @format An object of class \code{"vector"}
#'
#' @keywords datasets
#'
#' @source \href{https://usa.ipums.org/usa-action/variables/BPL#codes_section}{IPUMS BPL Codes}
#'
#' @examples
#' data(state.ipums.bpl)
#' x <- c("New York", "Virginia")
#' state.ipums.bpl[match(x, state.name)]
"state.ipums.bpl"
