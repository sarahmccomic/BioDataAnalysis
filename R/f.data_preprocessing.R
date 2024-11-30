# R/data_preprocessing.R
#'
#' Filters genes with low expression counts across samples.
#'
#' @param data A data frame with genes as rows and samples as columns.
#' @param threshold Numeric, the minimum sum of counts to keep a gene.
#' @param by Character, "rows" to filter genes or "columns" to filter samples.
#' @return A data frame with only rows or columns that meet the expression threshold.
#' @export
filter_low_expression <- function(data, threshold = 10, by = "rows") {
  # Ensure 'data' is numeric
  if (!is.data.frame(data) && !is.matrix(data)) {
    stop("Input data must be a data frame or matrix.")
  }

  if (!is.numeric(threshold) || threshold <= 0) {
    stop("Threshold must be a positive numeric value.")
  }

  # Filter rows or columns based on the 'by' argument
  if (by == "rows") {
    data[rowSums(data) > threshold, , drop = FALSE]
  } else if (by == "columns") {
    data[, colSums(data) > threshold, drop = FALSE]
  } else {
    stop("Invalid value for 'by'. Use 'rows' or 'columns'.")
  }
}

#' Normalize Counts
#'
#' Applies a simple normalization technique to make counts comparable across samples.
#' @param data A data frame with genes as rows and samples as columns.
#' @return A normalized data frame.
#' @export
normalize_counts <- function(data) {
  t(t(data) / colSums(data)) * 1e6  # Normalize to counts per million
}
#'
#' Log Transform Data
#'
#' Performs log transformation on gene expression data.
#' @param data A data frame with genes as rows and samples as columns.
#' @return A log-transformed data frame.
#' @export
log_transform <- function(data) {
  log2(data + 1)  # Adding 1 to avoid log(0)
}
