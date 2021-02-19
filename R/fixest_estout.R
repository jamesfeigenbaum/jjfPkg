#' @title Fixest to Tex Fragment Helper Function
#'
#' @description Helper function that will output a tex fragment
#'
#' @param est_tex tex output from etable with regressions to be texed out
#' @param file path to location to save tex output
#'
#' @return tex output
#'
#' @import magrittr
#' @importFrom dplyr tibble mutate select row_number case_when group_by if_else pull distinct
#' @importFrom tidyr unnest
#' @importFrom stringr str_detect str_replace_all str_squish
#'
#' @export fixest_estout
#'

# helper function to output tex fragment formatted like i want
fixest_estout <- function(est_tex, file) {

  out_tex <-
    est_tex %>%
    # cut vector at \n
    strsplit(split = "\n") %>%
    # convert to tibble with some helper columns
    tibble(raw = .) %>%
    mutate(id = row_number()) %>%
    unnest(cols = raw) %>%
    # cut anything that says tabular
    mutate(tabular = str_detect(raw, "tabular")) %>%
    filter(tabular != TRUE) %>%
    mutate(model_numbers = str_detect(raw, "^&\\(1")) %>%
    mutate(before_model_numbers = cumsum(model_numbers)) %>%
    filter(before_model_numbers != 0) %>%
    select(id, raw) %>%
    group_by(id) %>%
    nest() %>%
    ungroup() %>%
    mutate(id = row_number()) %>%
    unnest(cols = c(data)) %>%
    select(tex = raw, id) %>%
    mutate(midrules = cumsum(str_detect(tex, "midrule"))) %>%
    mutate(type = case_when(id == 1L ~ "model_numbers",
                            id == 2L ~ "first_midrule",
                            id == 3L ~ "coeffs",
                            midrules == 2L ~ "stats",
                            TRUE ~ "fes")) %>%
    # drop conseq duplicate rows
    # hack to deal with FEs given same names
    # so they are in the same row
    # but causes TROUBLE when SEs are the same for different vars...
    # distinct() %>%
    # order within category
    group_by(id) %>%
    mutate(id1 = row_number()) %>%
    # wrap model numbers in multicolumn
    mutate(tex = if_else(type == "model_numbers",
                         str_replace_all(tex, "\\(([0-9]+)\\)", "\\\\multicolumn{1}{c}{(\\1)}"),
                         tex)) %>%
    # addlinespace after SE
    mutate(se = (type == "coeffs" & id1 %% 2 == 0)) %>%
    mutate(tex = if_else(se == TRUE,
                         str_replace_all(tex, "\\\\\\\\$", "\\\\\\\\ \\\\addlinespace"),
                         tex)) %>%
    # addlinespace after FEs
    # but NOT in FE variable names...
    mutate(tex = if_else(type == "fes",
                         str_replace_all(tex, "\\\\\\\\$", "\\\\\\\\ \\\\addlinespace"),
                         tex)) %>%
    # spaces around &s
    mutate(tex = str_replace_all(tex, "&", " & ") %>% str_squish()) %>%
    # put FE stuff and sum stat stuff in multicolumns
    mutate(tex = if_else(type %in% c("fes", "stats"),
                         str_replace_all(tex, "& ([A-Za-z0-9.,]+)", "& \\\\multicolumn{1}{c}{\\1}"),
                         tex))

  out_tex %>%
    pull(tex) %>%
    cat(file = file, sep = "\n")

  out_tex %>%
    pull(tex) %>%
    return()

}
