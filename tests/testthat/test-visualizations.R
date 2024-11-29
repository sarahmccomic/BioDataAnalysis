test_that("plot_pca generates PCA plot", {

  set.seed(32608)
  sample_data <- as.data.frame(matrix(rnorm(100), nrow = 10))
  colnames(sample_data) <- paste0("Sample", 1:10)
  rownames(sample_data) <- paste0("Gene", 1:10)

  pca_plot <- plot_pca(sample_data)

  expect_s3_class(pca_plot, "ggplot")

  pca <- prcomp(t(sample_data), scale. = TRUE)

  expected_dim <- c(ncol(sample_data), min(nrow(sample_data), ncol(sample_data)))
  expect_equal(dim(pca$x), expected_dim)  # Correct dimensions

  plot_data <- ggplot2::ggplot_build(pca_plot)$data[[1]]
  expect_true("x" %in% names(plot_data))  # Corresponds to PC1
  expect_true("y" %in% names(plot_data))  # Corresponds to PC2
})
