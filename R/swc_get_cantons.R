swc_get_cantons <- function() {
  readr::read_csv(csv_file("cantons"), col_types = readr::cols())
}

csv_file <- function(name) {
  system.file("csv", paste0(name, ".csv"), package = "SwissCommunes")
}