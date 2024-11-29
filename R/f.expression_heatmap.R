# File: R/visualization.R

#' Plot Expression Heatmap
#'
#' @param data A data frame of expression data.
#' @return A heatmap 
#' @export
#' @importFrom ggplot2 ggplot geom_tile aes
plot_expression_heatmap <- function(data) {
  ggplot2::ggplot(data, ggplot2::aes(x = Gene, y = Sample, fill = Expression)) +
    ggplot2::geom_tile()
}
