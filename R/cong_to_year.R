#' @title Convert between Congress Number and Election Year
#'
#' @description Some data is by year and some with congress number.
#'     Inevitably, you need it the other way...
#'
#' @param cong the congress number (1 to... 115 as of 2018, but any integer will work)
#' @export
#'
#' @examples
#'
#' # the 100th congress was elected in 1986
#'
#' cong_to_year(100)
#'

cong_to_year <- function(cong) {

  return(cong * 2 + 1786)

}
