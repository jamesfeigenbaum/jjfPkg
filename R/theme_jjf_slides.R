#' @title JJF Theme Function for Slides
#'
#' @description JJF custom ggplot2 theme for slides
#'     Clean white backgrounds, nice narrow font, etc.
#'
#' @param font the font to use in the graph with Roboto Condensed as the default
#' @param fontsize the font size, 12 is good for papers and 20 for slides
#'
#' @keywords theme
#' @import ggplot2
#' @export
#' @examples \dontrun{
#'
#' ggplot2::ggplot(cars, aes(x = dist, y = speed)) +
#'   geom_point() +
#'   theme_jjf_slides()
#'
#' # same as above, roboto Condensed is the default
#' ggplot2::ggplot(cars, aes(x = dist, y = speed)) +
#'   geom_point() +
#'   theme_jjf_slides(font = "Roboto Condensed")
#'
#' # ggplot2::ggplot(cars, aes(x = dist, y = speed)) +
#' #  geom_point() +
#' #  theme_jjf_slides(font = "CMU Sans Serif")
#' }
#'

theme_jjf_slides <- function(font = "Roboto Condensed", fontsize = 20) {
  ggplot2::theme(
    # make the background white (blank)
    panel.background = element_blank(),
    # and no ugly legend backgrounds
    legend.background = element_blank(),
    legend.key = element_blank(),
    # and put the legend at the bottom
    legend.position = "bottom",
    # and if the caption is good enough, no legend title
    legend.title = element_blank(),
    # and turn on the axis lines (buggy for now, set x and y sep)
    panel.border = element_blank(),
    axis.line.x = element_line(size = 0.5, color = "black", linetype = "solid"),
    axis.line.y = element_line(size = 0.5, color = "black", linetype = "solid"),
    # and turn off the background of the facet titles
    strip.background = element_blank(),
    # and center the title and make it 1.5x the rest of the text
    plot.title = element_text(hjust = 0.5, size = rel(1.5)),
    plot.subtitle = element_text(hjust = 0.5),
    # a bit of space around the plot
    plot.margin = unit(c(1, 1, 1, 1), "lines"),
    # and make the font size 20 and roboto condensed
    text = element_text(size = fontsize, family = font)
  )
}
