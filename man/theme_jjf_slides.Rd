% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_jjf_slides.R
\name{theme_jjf_slides}
\alias{theme_jjf_slides}
\title{JJF Theme Function for Slides}
\usage{
theme_jjf_slides(font = "Roboto Condensed", fontsize = 20)
}
\arguments{
\item{font}{the font to use in the graph with Roboto Condensed as the default}

\item{fontsize}{the font size, 12 is good for papers and 20 for slides}
}
\description{
JJF custom ggplot2 theme for slides
    Clean white backgrounds, nice narrow font, etc.
}
\examples{
\dontrun{

ggplot2::ggplot(cars, aes(x = dist, y = speed)) +
  geom_point() +
  theme_jjf_slides()

# same as above, roboto Condensed is the default
ggplot2::ggplot(cars, aes(x = dist, y = speed)) +
  geom_point() +
  theme_jjf_slides(font = "Roboto Condensed")

# ggplot2::ggplot(cars, aes(x = dist, y = speed)) +
#  geom_point() +
#  theme_jjf_slides(font = "CMU Sans Serif")
}

}
\keyword{theme}
