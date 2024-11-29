test_data <- data.frame(
  Gene = rep(c("Gene1", "Gene2", "Gene3"), each = 3),
  Sample = rep(c("Sample1", "Sample2", "Sample3"), times = 3),
  Expression = c(10, 15, 20, 5, 10, 15, 0, 5, 10)
)

library(testthat)
library(ggplot2)

test_that("plot_expression_heatmap works correctly", {
  heatmap_plot <- plot_expression_heatmap(test_data)

  expect_true(inherits(heatmap_plot, "ggplot"))

  expect_true("GeomTile" %in% sapply(heatmap_plot$layers, function(layer) class(layer$geom)[1]))
})
