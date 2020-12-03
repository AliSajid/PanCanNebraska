## code to prepare `kd_metadata` dataset goes here

library(tidyverse)

kd_metadata <- read_tsv("raw/LINCS-KD-Metadata.xls")

usethis::use_data(kd_metadata, overwrite = TRUE, internal = TRUE)
