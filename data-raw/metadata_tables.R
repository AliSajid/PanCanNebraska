## code to prepare `metadata_tables` dataset goes here

oe_metadata <- read_tsv("raw/LINCS-OE-Metadata.xls")
kd_metadata <- read_tsv("raw/LINCS-KD-Metadata.xls")
pb_metadata <- read_tsv("raw/LINCS-Perturbagen-Metadata.xls")

usethis::use_data(oe_metadata, kd_metadata, pb_metadata,
                  internal = TRUE, overwrite = TRUE)
