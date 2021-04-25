#' @title Convert IPUMS educ variable to years of schooling
#'
#' @description XWalk to convert the IPUMS education variable to years of schooling
#'
#' @import magrittr
#' @importFrom tibble tribble
#'
#' @export

ipums_educ <- function() {

  tibble::tribble(
    ~educ,                                            ~label,   ~count_100,  ~count_1, ~years_schooling,
       0L,                             "N/A or no schooling",          "·",       "·",               NA_integer_,
       1L,                                             "N/A",          "·",       "·",               NA_integer_,
       2L,                          "No schooling completed", "14,955,972", "183,660",               0L,
      10L,                       "Nursery school to grade 4",          "·",       "·",               0L,
      11L,                       "Nursery school, preschool",          "2",       "·",               0L,
      12L,                                    "Kindergarten",     "14,384",       "·",               0L,
      13L,                             "Grade 1, 2, 3, or 4",          "·",       "·",               NA,
      14L,                                         "Grade 1",  "3,440,010",  "38,515",               1L,
      15L,                                         "Grade 2",  "3,869,970",  "42,574",               2L,
      16L,                                         "Grade 3",  "4,810,744",  "52,154",               3L,
      17L,                                         "Grade 4",  "6,426,673",  "68,980",               4L,
      20L,                             "Grade 5, 6, 7, or 8",          "·",       "·",               NA,
      21L,                                    "Grade 5 or 6",          "·",       "·",               NA,
      22L,                                         "Grade 5",  "6,316,113",  "67,862",               5L,
      23L,                                         "Grade 6",  "7,991,036",  "84,695",               6L,
      24L,                                    "Grade 7 or 8",          "·",       "·",               NA,
      25L,                                         "Grade 7",  "8,256,684",  "87,423",               7L,
      26L,                                         "Grade 8", "25,125,217", "260,967",               8L,
      30L,                                         "Grade 9",  "7,397,098",  "77,531",               9L,
      40L,                                        "Grade 10",  "7,780,233",  "80,394",              10L,
      50L,                                        "Grade 11",  "4,864,164",  "50,453",              11L,
      60L,                                        "Grade 12", "15,909,155", "161,625",              12L,
      61L,                          "12th grade, no diploma",          "·",       "·",               NA,
      62L,                     "High school graduate or GED",          "·",       "·",               NA,
      63L,                     "Regular high school diploma",          "·",       "·",               NA,
      64L,                   "GED or alternative credential",          "·",       "·",               NA,
      65L,              "Some college, but less than 1 year",          "·",       "·",               NA,
      70L,                               "1 year of college",  "2,028,766",  "20,790",              13L,
      71L,    "1 or more years of college credit, no degree",          "·",       "·",               NA,
      80L,                              "2 years of college",  "2,399,490",  "24,484",              14L,
      81L,          "Associate's degree, type not specified",          "·",       "·",               NA,
      82L,        "Associate's degree, occupational program",          "·",       "·",               NA,
      83L,            "Associate's degree, academic program",          "·",       "·",               NA,
      90L,                              "3 years of college",  "1,031,286",  "10,416",              15L,
     100L,                              "4 years of college",  "2,829,116",  "28,581",              16L,
     101L,                               "Bachelor's degree",          "·",       "·",               NA,
     110L,                             "5+ years of college",    "806,891",  "10,628",              17L,
     111L,            "6 years of college (6+ in 1960-1970)",     "86,582",       "·",              17L,
     112L,                              "7 years of college",     "56,929",       "·",              17L,
     113L,                             "8+ years of college",     "98,979",       "·",              17L,
     114L,                                 "Master's degree",          "·",       "·",               NA,
     115L,  "Professional degree beyond a bachelor's degree",          "·",       "·",               NA,
     116L,                                 "Doctoral degree",          "·",       "·",               NA,
     999L,                                         "Missing",  "5,408,416",       "·",               NA
    ) %>%
    return()

}
