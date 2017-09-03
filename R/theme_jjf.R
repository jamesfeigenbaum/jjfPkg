#' JJF Theme Function
#'
#' Add my custom ggplot2 theme
#' @param font
#' @keywords theme
#' @export
#' @examples
#' theme_jjf()

theme_jjf <- function (font = "Roboto Condensed") {
	theme(
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
    # and make the font size 12 and computer modern
    text = element_text(size = 12, family = font)
	)
}
