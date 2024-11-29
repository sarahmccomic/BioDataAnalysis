# R/visualizations.R


utils::globalVariables(c("average_expression", "logFC", "PC1", "PC2", "p_value"))

#' Volcano Plot
#'
#' Creates a volcano plot for differential expression results.
#' @param data A data frame with columns for log fold change and p-value.
#' @importFrom ggplot2 ggplot aes geom_point theme_minimal
#' @export
plot_volcano <- function(data) {
  ggplot(data, aes(x = logFC, y = -log10(p_value))) +
    geom_point() +
    theme_minimal()
}

#' MA Plot
#'
#' Creates an MA plot for gene expression data. Log ratio (M) and log average (A).
#' @param data A data frame with columns for average expression and log fold change.
#' @importFrom ggplot2 ggplot aes geom_point theme_minimal
#' @export
plot_ma <- function(data) {
  ggplot(data, aes(x = average_expression, y = logFC)) +
    geom_point() +
    theme_minimal()
}

#' Heatmap of Gene Expression
#'
#' Plots a heatmap for gene expression data.
#' @param data A data frame with genes as rows and samples as columns.
#' @importFrom pheatmap pheatmap
#' @export
heatmap_gene_expression <- function(data) {
  pheatmap::pheatmap(data)
}

#' PCA Plot
#'
#' Generates a PCA plot for sample clustering (Principal component analysis).
#' @param data A data frame with genes as rows and samples as columns.
#' @importFrom stats prcomp
#' @importFrom ggplot2 ggplot aes geom_point theme_minimal
#' @importFrom ggplot2 labs
#' @importFrom factoextra fviz_pca_ind
#' @export
plot_pca <- function(data) {
  pca <- prcomp(t(data), scale. = TRUE)  # Perform PCA
  pca_data <- data.frame(pca$x)  # Extract PCA scores
  pca_data$sample <- rownames(pca_data)  # Add sample names

  ggplot(pca_data, aes(x = PC1, y = PC2)) +
    geom_point() +
    theme_minimal() +
    labs(title = "PCA Plot", x = "Principal Component 1", y = "Principal Component 2")
}

