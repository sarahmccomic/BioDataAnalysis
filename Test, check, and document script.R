devtools::check()
devtools::document()
devtools::build()

usethis::use_mit_license("Sarah McComic")

install.packages("BiocManager")

BiocManager::install(c("edgeR", "DESeq2", "clusterProfiler", "biomaRt", "topGO", "STRINGdb"))

library(roxygen2)
roxygen2::roxygenise()

devtools::install()

install.packages("ggfortify")
library(ggfortify)

ls("package:ggfortify")

install.packages("clusterProfiler")

install.packages("BiocManager")
BiocManager::install("clusterProfiler")
BiocManager::install(c("ReactomePA", "TFBSTools", "motifStack"))

library(clusterProfiler)
ls("package:clusterProfiler")

library(topGO)
ls("package:topGO")

install.packages("phangorn")
library(phangorn)

install.packages("httr", "Biostrings")
library(httr)
library(Biostrings)
install("msa")
install.packages("ape")
library(msa)
library(ape)

library(testthat)
test_file("tests/testthat/test-data_preprocessing.R")

test_file("tests/testthat/test-expression_heatmap.R")

test_file("tests/testthat/test-functional_enrichment.R")

test_file("tests/testthat/test-network_analysis.R")

test_file("tests/testthat/test-group_comparison_stats.R")

test_file("tests/testthat/test-machine_learning.R")

test_file("tests/testthat/test-normalize_expression.R")

test_file("tests/testthat/test-visualizations.R")

test_file("tests/testthat/test-statistical_analysis.R")

install.packages("usethis")
usethis::use_git_ignore()

usethis::write_union(".gitignore", c(
  ".Rproj.user",
  ".Rhistory",
  ".RData",
  ".Rproj",
  "*.tar.gz",
  "*.Rcheck/"
))
update.packages(ask = FALSE)
