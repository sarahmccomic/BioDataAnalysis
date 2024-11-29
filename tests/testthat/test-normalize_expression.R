set.seed(32608)
sample_data <- as.data.frame(matrix(rnorm(100), nrow = 10))
colnames(sample_data) <- paste0("Sample", 1:10)
rownames(sample_data) <- paste0("Gene", 1:10)

test_that("normalize_expression works with log normalization", {
  abs_data <- abs(sample_data)  # Ensure non-negative data
  result <- normalize_expression(abs_data, method = "log")

  expect_s3_class(result, "data.frame")

  expect_true(all(result >= 0))  # log2(x + 1) is always >= 0

  expect_equal(dim(result), dim(sample_data))
})

test_that("normalize_expression works with z-score normalization", {
  result <- normalize_expression(sample_data, method = "z-score")

  expect_s3_class(result, "data.frame")

  column_means <- colMeans(result)
  column_sds <- apply(result, 2, sd)
  expect_true(all(abs(column_means) < 1e-6))  # Close to 0

  expect_true(all(abs(column_sds - 1) < 1e-6))  # Close to 1

  expect_equal(dim(result), dim(sample_data))
})
