# File: R/statistics.R

#' Compare Biological Groups with t-test or ANOVA
#'
#' @param data A data frame.
#' @param group A grouping variable.
#' @param test_type "t-test" or "anova".
#' @return Results
#' @export
#' @importFrom stats t.test aov
Group_comparison <- function(data, group, test_type = "t-test") {
  if (test_type == "t-test") {
    return(t.test(data ~ group))
  } else if (test_type == "anova") {
    return(aov(data ~ group))
  } else {
    stop("Unsupported test type.")
  }
}
