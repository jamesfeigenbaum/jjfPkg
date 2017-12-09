#' JJF Convert between Congress Number and Election Year
#'
#' Some data is by year and some with congress number
#' @param cong the congress number (1 to 115 as of 2018)
#' @param year the election year (1788 to 2018, roughly)
#' @export
#'
#' @examples
#'
#' # the 100th congress was elected in 1986
#'
#' cong_to_year(100)
#'
#' year_to_cong(1986)
#'

cong_to_year <- function(cong) {

  return(cong * 2 + 1786)

}

year_to_cong <- function(year) {

  return((year - 1786)/2)

}
