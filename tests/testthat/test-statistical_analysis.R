
library(testthat)

set.seed(32608)
sample_data <- as.data.frame(matrix(rnorm(100), nrow = 10))
colnames(sample_data) <- paste0("Sample", 1:10)
rownames(sample_data) <- paste0("Gene", 1:10)
mock_group_labels <- factor(rep(c("Group1", "Group2"), each = 5))

test_that("differential_expression generates valid results", {
  result <- differential_expression(sample_data, mock_group_labels)

  expect_s3_class(result, "data.frame")

  expect_true(all(c("logFC", "p_value") %in% colnames(result)))

  expect_equal(nrow(result), nrow(sample_data))

  expect_type(result$logFC, "double")

  expect_true(all(result$p_value >= 0 & result$p_value <= 1))
})

test_that("p_adjust adjusts p-values correctly", {

  sample_p_values <- runif(10, min = 0, max = 1)

  adjusted_p_values <- p_adjust(sample_p_values)

  expect_type(adjusted_p_values, "double")

  expect_true(all(adjusted_p_values >= 0 & adjusted_p_values <= 1))

  expect_equal(length(adjusted_p_values), length(sample_p_values))
})

test_that("correlation_matrix calculates valid correlation matrix", {
  cor_matrix <- correlation_matrix(sample_data)

  expect_true(is.matrix(cor_matrix))

  expect_true(all(cor_matrix == t(cor_matrix)))

  expect_equal(dim(cor_matrix), c(nrow(sample_data), nrow(sample_data)))

  expect_true(all(diag(cor_matrix) == 1))
})
