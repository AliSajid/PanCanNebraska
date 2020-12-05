if (file.exists("~/.Rprofile")) {
  source("~/.Rprofile")
}
source("renv/activate.R")

tag_release <- function() {
  git2r::tag(name = paste0("r", packageVersion("PanCanNebraska")))
}
