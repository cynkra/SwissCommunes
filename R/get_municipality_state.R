#' Existing municipalities in a specified year
#'
#' This function produces a tibble containing the names and BFS-numbers
#' (official municipality numbers) of all existing municipalities in a given year.
#' Filtering by canton is supported.
#'
#' @param year Year of interest (integer).
#' @param canton Canton abbreviation as character (e.g. "GE", "ZH", "TI", etc.) to focus on.
#' If left `NULL` (default) all cantons are considered.
#'
#' @return Tibble containing municipality numbers (BFS-numbers) and names of existing
#' municipalities in the given year.
#' @export
#'
#' @examples
#' swc_get_municipality_state(1987)
#' swc_get_municipality_state(2000, "ZH")
swc_get_municipality_state <- function(year, canton = NULL) {
  mutations <- swc_get_mutations(canton = canton)

  mutations_filtered <- mutations %>%
    mutate(mutation_year = lubridate::year(mMutationDate - 1)) %>%
    filter(mutation_year < year)

  admitted <-
    mutations_filtered %>%
    filter(!duplicated(mId.y, fromLast = TRUE))

  abolished <-
    mutations_filtered %>%
    select(mHistId.y = mHistId.x)

  final <-
    admitted %>%
    anti_join(abolished, by = "mHistId.y")

  final %>%
    arrange(mId.y) %>%
    select(mun_id = mId.y, short_name = mShortName.y)
}
