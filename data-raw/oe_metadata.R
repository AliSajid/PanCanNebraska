## code to prepare `oe_metadata` dataset goes here

library(tidyverse)

oe_metadata <- read_tsv("raw/LINCS-OE-Metadata.xls")

usethis::use_data(oe_metadata, overwrite = TRUE, internal = TRUE)
