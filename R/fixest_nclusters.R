#' @title Number of Clusters Helper Function for Fixest
#'
#' @description Helper function that will output the number of clusters
#'
#' @param est output from fixest::feols or another regression function
#'
#' @return row of number of clusters
#'
#' @import magrittr
#' @importFrom purrr map_int
#'
#' @export fixest_ymean
#'

fixest_nclusters <- function(est) {

  est %>%
    as.list() %>%
    map_int( ~ .x$cov.scaled %>% attributes() %>% .$G)

}
