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
#' @importFrom stringr str_detect str_replace_all str_squish str_split str_trim
#'
#' @export fixest_estout
#'

# helper function to output tex fragment formatted like i want
fixest_estout <- function(est_tex, file) {

  out_tex <-
    est_tex %>%
    # convert to tibble with some helper columns
    tibble(raw = .) %>%
    # cut anything that says tabular
    mutate(tabular = str_detect(raw, "tabular")) %>%
    filter(tabular != TRUE) %>%
    # remove the endgroup thing at the end
    filter(!str_detect(raw, "endgroup")) %>%
    mutate(model_numbers = str_detect(raw, " & \\(1\\)")) %>%
    mutate(before_model_numbers = cumsum(model_numbers)) %>%
    filter(before_model_numbers != 0) %>%
    mutate(id = row_number()) %>%
    select(tex = raw, id) %>%
    mutate(tex = tex %>% as.character() %>% str_trim()) %>%
    mutate(midrules = cumsum(str_detect(tex, "midrule"))) %>%
    # find ses (this also catches model numbers...)
    mutate(se1 = str_detect(tex, "& \\(") %>% as.integer()) %>%
    mutate(se2 = cumsum(str_detect(tex, "& \\(")) - se1) %>%
    mutate(type = case_when(id == 1L ~ "model_numbers",
                            id == 2L ~ "first_midrule",
                            midrules == 1L & se2 < max(se2) ~ "coeffs",
                            se2 == max(se2) & midrules != 2L ~ "fes",
                            midrules == 2L ~ "stats")) %>%
    # order within category
    group_by(type) %>%
    mutate(id1 = row_number()) %>%
    # wrap model numbers in multicolumn
    mutate(tex = if_else(type == "model_numbers",
                         str_replace_all(tex, "\\(([0-9]+)\\)", "\\\\multicolumn{1}{c}{(\\1)}"),
                         tex)) %>%
    # addlinespace after SE
    mutate(se = (type == "coeffs" & se1 == 1L)) %>%
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

  # save out
  out_tex %>%
    pull(tex) %>%
    str_split("\\\\add") %>%
    unlist() %>%
    str_replace_all("^linespace$", "\\\\addlinespace") %>%
    str_trim() %>%
    cat(file = file, sep = "\n")

  # and display
  out_tex %>%
    pull(tex) %>%
    return()

}
