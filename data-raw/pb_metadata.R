## code to prepare `pb_metadata` dataset goes here

library(tidyverse)

pb_metadata <- read_tsv("raw/LINCS-Perturbagen-Metadata.xls")

usethis::use_data(pb_metadata, overwrite = TRUE, internal = TRUE)
