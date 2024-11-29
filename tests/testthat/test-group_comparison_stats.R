set.seed(32608)
mock_data <- data.frame(
  values = c(rnorm(10, mean = 5), rnorm(10, mean = 6)),
  group = rep(c("Group1", "Group2"), each = 10)
)

library(testthat)
set.seed(32608)
mock_data <- data.frame(
  values = c(rnorm(10, mean = 5), rnorm(10, mean = 6)),
  group = rep(c("Group1", "Group2"), each = 10)
)

test_that("Group_comparison performs t-test correctly", {
  result <- Group_comparison(data = mock_data$values, group = mock_data$group, test_type = "t-test")

  expect_type(result, "list")

  expect_true(all(c("statistic", "p.value") %in% names(result)))

  expect_type(result$p.value, "double")
  expect_true(result$p.value >= 0 && result$p.value <= 1)
})

test_that("Group_comparison performs ANOVA correctly", {
  result <- Group_comparison(data = mock_data$values, group = mock_data$group, test_type = "anova")

  expect_s3_class(result, "aov")

  summary_result <- summary(result)
  expect_s3_class(summary_result, "summary.aov")
})

test_that("Group_comparison handles unsupported test types", {
  expect_error(Group_comparison(data = mock_data$values, group = mock_data$group, test_type = "unsupported"),
               "Unsupported test type.")
})
