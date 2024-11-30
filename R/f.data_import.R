# f.data_import.R

# Inform R about global variables to avoid "no visible binding" notes
utils::globalVariables(c("Gene", "Sample", "Expression"))

#' Import Biological Data
#'
#' @param file_path Path to the data file.
#' @param file_type Type of file, e.g., "csv" or "excel".
#' @return A data frame with imported data.
#' @export
#' @importFrom readr read_csv
#' @importFrom readxl read_excel
import_data <- function(file_path, file_type = "csv") {
  if (file_type == "csv") {
    data <- readr::read_csv(file_path)
  } else if (file_type == "excel") {
    data <- readxl::read_excel(file_path)
  } else {
    stop("Unsupported file type.")
  }
  return(data)
}
