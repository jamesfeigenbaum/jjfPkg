#' @title Ymeans Helper Function for Fixest
#'
#' @description Helper function that will output the ymean
#'
#' @param est output from fixest::feols or another regression function
#'
#' @return row of ymeans
#'
#' @import magrittr
#' @importFrom purrr map_dbl
#'
#' @export fixest_ymean
#'

fixest_ymean <- function(est) {

  est %>%
    as.list() %>%
    map_dbl( ~ fixest:::model.matrix.fixest(., type = "lhs") %>% .[[1]] %>% mean())

}
