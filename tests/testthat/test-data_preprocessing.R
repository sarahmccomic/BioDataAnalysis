install.packages("testthat")
library(testthat)

test_data <- data.frame(
  Sample1 = c(0, 50, 200, 0, 10),
  Sample2 = c(5, 100, 300, 1, 15),
  Sample3 = c(2, 75, 250, 0, 20),
  row.names = c("Gene1", "Gene2", "Gene3", "Gene4", "Gene5")
)

library(testthat)

test_that("filter_low_expression works correctly", {
  filtered <- filter_low_expression(test_data, threshold = 100)
  expect_equal(rownames(filtered), c("Gene2", "Gene3"))
  expect_true(all(rowSums(filtered) > 100))
})

test_that("normalize_counts works correctly", {
  normalized <- normalize_counts(test_data)
  expect_equal(unname(round(colSums(normalized), 1)), c(1e6, 1e6, 1e6))  # Ignore names
  expect_true(all(normalized >= 0))  # No negative values
})

test_that("log_transform works correctly", {
  log_transformed <- log_transform(test_data)
  expect_true(all(log_transformed >= 0))  # Log values should be non-negative
  expect_equal(log_transformed["Gene3", "Sample1"], log2(test_data["Gene3", "Sample1"] + 1))
})
