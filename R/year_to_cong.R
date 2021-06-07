#' @title Convert between Congress Number and Election Year
#'
#' @description Some data is by year and some with congress number.
#'     Inevitably, you need it the other way...
#'
#' @param year the election year (1788 to any year, must be even)
#' @export
#'
#' @examples
#'
#' # the 100th congress was elected in 1986
#'
#' year_to_cong(1986)
#'

year_to_cong <- function(year) {

  if (year %% 2 == 0) {

    return((year - 1786)/2)

  } else {
    return(NA_integer_)
  }
}
