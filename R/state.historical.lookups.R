#' @title State Historical Look Ups
#'
#' @name state.historical
#' @rdname state.historical
#'
#' @description Several simple vectors to use like state.abb or state.name
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
#' # state in joined the Confederacy?
#' state.union[match(x, state.name)]
#' # state remained loyal to Union?
#' state.civilwar[match(x, state.name)]
#' # state's side in the Civil War (Union, Confederacy, or Territory)
#' state.admission[match(x, state.name)]
#' # year of state's admission to the US
#' state.13.colony[match(x, state.name)]
#' # an original 13 colony state?
#' state.slavery.1860[match(x, state.name)]
#' # did the state permit slavery in 1860?
#'
#' @rdname state.historical

NULL

#' @rdname state.historical

"state.confederacy"

#' @rdname state.historical

"state.union"

#' @rdname state.historical

"state.civilwar"

#' @rdname state.historical

"state.admission"

#' @rdname state.historical

"state.13.colony"

#' @rdname state.historical

"state.slavery.1860"
