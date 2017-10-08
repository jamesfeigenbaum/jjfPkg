#' JJF eststore function
#'
#' Store regression output in a list list statas eststore
#' @param "est, estlist_arg"
#' @keywords eststore
#' @export
#' @examples
#' eststore()

eststore <- function(est, estlist_arg = estlist) {
  
  # estlist name
  estlist_string <-
    substitute(estlist_arg) %>%
    deparse()
  
  # if the estlist doesn't already exist or is empty make it
  # otherwise add to it
  if (!exists(estlist_string)) {
    
    out <-
      est %>%
      list()
    
  } else {
    
    out <-
      est %>%
      list() %>%
      c(estlist_arg, .)
    
  }
  
  enviro <-
    environment() %>%
    parent.env()
  
  estlist_string %>% 
    assign(out, pos = enviro)
  
}