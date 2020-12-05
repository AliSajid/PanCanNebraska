#' Generate a Consensus list of Targets
#'
#' This function takes a list of (optionally split) concordance dataframes and returns
#' a ranked list of gene or drug targets that have been chose for their maximal
#' similarity to the signature
#'
#' @param ... One or Two (see paired) Data Frames with the concordants
#' @param paired Logical indicating whether you split the dataframes by up and down regulated in prior analysis
#' @param cutoff A similarity cutoff value. Defaults to 0.321
#' @param cell_line A character vector of Cell Lines you are interested in.
#' @param discordant Logical indicating whether you want discordant signatures
#'
#' @return A tibble with the filtered and deduplicated results
#' @export
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr filter arrange any_of group_by across select bind_rows
#' @importFrom rlang .data
#'
#' @examples
#' TRUE
consensus_concordants <- function(..., paired = FALSE, cutoff = 0.321,
                                  cell_line = NULL, discordant = FALSE) {

    if (paired & length(list(...)) != 2) {
      stop("Paired analysis requires two data frames")
    } else if (!paired & length(list(...)) != 1) {
      stop("Unpaired analysis requires only one dataframe")
    }

  concordants <- dplyr::bind_rows(list(...))

  if (!is.null(cell_line)) {
    concordants <- concordants %>%
      dplyr::filter(.data$cellline %in% cell_line)
  }

  if (discordant) {
    filtered <- concordants %>%
      dplyr::filter(.data$similarity <= -cutoff) %>%
      dplyr::group_by(
        dplyr::across(dplyr::any_of(c("treatment", "compound")))
      ) %>%
      dplyr::filter(abs(.data$similarity) == max(abs(.data$similarity))) %>%
      dplyr::select(.data$signatureid, dplyr::any_of(c("treatment", "compound")), .data$similarity) %>%
      dplyr::arrange(abs(.data$similarity))
  } else {
    filtered <- concordants %>%
      dplyr::filter(.data$similarity >= cutoff) %>%
      dplyr::group_by(
        dplyr::across(dplyr::any_of(c("treatment", "compound")))
      ) %>%
      dplyr::filter(abs(.data$similarity) == max(abs(.data$similarity))) %>%
      dplyr::select(.data$signatureid, dplyr::any_of(c("treatment", "compound")), .data$similarity) %>%
      dplyr::arrange(abs(.data$similarity))
  }

  filtered
}
