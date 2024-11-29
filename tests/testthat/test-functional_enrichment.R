test_gene_list <- c("CA1", "CA2", "CA9", "CABeta", "CA10")

library(testthat)

test_that("gene_ontology_enrichment works correctly", {
  result <- gene_ontology_enrichment(test_gene_list)

  expect_s3_class(result, "data.frame")

  expect_true(all(c("GO_term", "p_value") %in% colnames(result)))

  expect_equal(nrow(result), 10)

  expect_true(all(result$p_value >= 0 & result$p_value <= 1))
})

test_that("pathway_enrichment works correctly", {
  result <- pathway_enrichment(test_gene_list)

  expect_s3_class(result, "data.frame")

  expect_true(all(c("Pathway", "p_value") %in% colnames(result)))

  expect_equal(nrow(result), 10)

  expect_true(all(result$p_value >= 0 & result$p_value <= 1))
})

test_that("motif_enrichment works correctly", {
  result <- motif_enrichment(test_gene_list)

  expect_s3_class(result, "data.frame")

  expect_true(all(c("Motif", "p_value") %in% colnames(result)))

  expect_equal(nrow(result), 10)

  expect_true(all(result$p_value >= 0 & result$p_value <= 1))
})
