#' @title Scrape IPUMS codes for any variable
#'
#' @description Pull the IPUMS codes to variable label lookup from the IPUMS website
#'
#' @param variable the name of the variable from ipums we want to scrape
#' @param detailed get the general or detailed codes default FALSE for just general
#'
#' @import magrittr
#' @importFrom stringr str_detect str_extract
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble filter select
#' @importFrom RCurl getURL
#'
#' @export ipums_codes
#'
#' @examples \dontrun{
#'
#' # get bpl codes
#'
#' bpl_codes_1 <- ipums_codes("bpl", detailed = TRUE)
#'
#' bpl_codes_2 <- ipums_codes("bpl", detailed = FALSE)
#'
#' }

ipums_codes <- function(variable, detailed = FALSE) {

  html <-
    variable %>%
    sprintf("https://usa.ipums.org/usa-action/variables/%s#codes_section", .) %>%
    RCurl::getURL()

  if (html %>% stringr::str_detect("doesn't exist") == TRUE){
    print("IPUMS variable not found")
    return()
  }

  out <-
    html %>%
    stringr::str_extract(".*categor.*") %>%
    stringr::str_extract("\\[.*\\]") %>%
    jsonlite::fromJSON() %>%
    dplyr::as_tibble() %>%
    dplyr::filter(!is.na(code))

  # general or not?
  no_general <- (out %>% dplyr::filter(general == TRUE) %>% nrow() == 0)

  if (detailed == TRUE | no_general == TRUE) {
    out %>%
      dplyr::select(code, label) %>%
      return()
  } else {
    out %>%
      dplyr::filter(general == TRUE) %>%
      dplyr::select(code, label) %>%
      return()
  }

}
