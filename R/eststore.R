#' JJF eststore function
#'
#' Store regression output in a list list statas eststore
#' @param est the regression estimate to be stored
#' @param estlist_arg the list of stored regressions
#' @keywords eststore
#' @return side effect style update the estlist_arg with the est
#' @examples
#' mtcars %>%
#'   lm(data = ., mpg ~ disp) %>%
#'   eststore(car_regs)
#'
#' mtcars %>%
#'   lm(data = ., mpg ~ hp) %>%
#'   eststore(car_regs)
#'
#' mtcars %>%
#'   lm(data = ., mpg ~ disp + hp) %>%
#'   eststore(car_regs)
#'
#' stargazer::stargazer(car_regs, type = "text")
#'
#' @export
#'

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

  enviro %>% print()
  
  estlist_string %>%
    assign(out, pos = enviro)

}
