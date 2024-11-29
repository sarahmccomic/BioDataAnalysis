# File: R/normalization.R

#' Normalize Gene/Protein Expression
#'
#' @param data A data frame with expression values.
#' @param method Method of normalization, e.g., "log" or "z-score".
#' @return A normalized data frame.
#' @export
normalize_expression <- function(data, method = "log") {
  if (method == "log") {
    return(log2(data + 1))
  } else if (method == "z-score") {
    return(as.data.frame(scale(data)))  # Explicitly convert to data.frame
  } else {
    stop("Unsupported normalization method.")
  }
}
