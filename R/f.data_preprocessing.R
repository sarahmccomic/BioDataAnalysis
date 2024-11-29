# R/data_preprocessing.R
#'
#' Filter Low Expression Genes
#'
#' Filters genes with low expression counts across samples.
#'
#' @param data A data frame with genes as rows and samples as columns.
#' @param threshold Numeric, the minimum sum of counts to keep a gene.
#' @return A data frame with only genes that meet the expression threshold.
#' @export
filter_low_expression <- function(data, threshold = 10) {
  data[rowSums(data) > threshold, ]
}
#'
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
