#' State Historical Look Ups
#'
#' Several simple vectors to use like state.abb or state.name
#' from the base datasets
#' Includes some for the Civil War, 13 colonies, union admission, etc
#'
#' @docType data
#'
#' @usage data(state.confederacy)
#' @usage data(state.union)
#' @usage data(state.civilwar)
#' @usage data(state.admission)
#' @usage data(state.13.colony)
#' @usage data(state.slavery.1860)
#'
#' @format An object of class \code{"vector"}
#'
#' @keywords datasets
#'
#' @source Wikipedia, mostly
#'
#' @examples
#' x <- c("New York", "Virginia", "West Virginia", "Colorado")
#' state.confederacy[match(x, state.name)]
#' state.union[match(x, state.name)]
#' state.civilwar[match(x, state.name)]
#' state.admission[match(x, state.name)]
#' state.13.colony[match(x, state.name)]
#' state.slavery.1860[match(x, state.name)]
"state.confederacy"
"state.union"
"state.civilwar"
"state.admission"
"state.13.colony"
"state.slavery.1860"
