test_gene_list <- c("CA1", "CA2", "CA9")

library(testthat)
library(igraph)

test_network <- graph_from_data_frame(
  data.frame(from = c("CA1", "CA2"), to = c("CA2", "CA9"))
)

test_that("get_ppi_network works correctly", {
  result <- get_ppi_network(test_gene_list)

  expect_s3_class(result, "data.frame")

  expect_true(all(c("Gene1", "Gene2") %in% colnames(result)))

  expect_true(all(result$Gene1 %in% test_gene_list))
  expect_true(all(result$Gene2 %in% test_gene_list))
})

test_that("calculate_network_centrality works correctly", {
  centrality <- calculate_network_centrality(test_network)

  expect_type(centrality, "double")
  expect_named(centrality)

  expect_equal(sort(names(centrality)), sort(V(test_network)$name))
})

test_that("visualize_network works correctly", {
  expect_silent(visualize_network(test_network))
})
