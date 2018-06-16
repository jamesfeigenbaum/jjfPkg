#' @importFrom extrafont loadfonts

.onAttach <- function(libname, pkgname) {

  # Ported from hrbrthemes
  # https://github.com/hrbrmstr/hrbrthemes/blob/4ed759095bb9c068852583d48acd7c8df7bb8a52/R/zzz.r

  if (.Platform$OS.type == "windows")  { # nocov start
    if (interactive()) packageStartupMessage("Registering Windows fonts with R")
    extrafont::loadfonts("win", quiet = TRUE)
  }

  if (getOption("hrbrthemes.loadfonts", default = FALSE)) {
    if (interactive()) packageStartupMessage("Registering PDF & PostScript fonts with R")
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }

  fnt <- extrafont::fonttable()
  if (!any(grepl("Arial[ ]Narrow|Roboto[ ]Condensed|CMU[ ]Sans[ ]Serif", fnt$FamilyName))) {
    packageStartupMessage("NOTE: Either Arial Narrow or Roboto Condensed or Computer Modern Sans Serif (beamer default")
    packageStartupMessage("      fonts are required to use these themes.")
    packageStartupMessage("      Please use hrbrthemes::import_roboto_condensed() to install Roboto Condensed and")
    packageStartupMessage("      if Arial Narrow is not on your system, please see http://bit.ly/arialnarrow")
    packageStartupMessage("      Computer Modern? On your own for now...")
  } # nocov end

}
