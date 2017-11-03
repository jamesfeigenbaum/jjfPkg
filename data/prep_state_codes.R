# #prep_state_codes.R
# #feigenbaum
# #3nov2017
#
# library(data.table)
# library(tidyverse)
# library(RCurl)
# library(jsonlite)
# library(stringr)
# library(magrittr)
#
# # load the state fips data and icpsr (in various) from Soodoku's gists
#
# state.fips.raw <- "https://gist.githubusercontent.com/soodoku/f9e18efe98f7d74931d8b4a79a49e6f5/raw/891f0ca1c84fb64c3aa8950f7e21c79b117402bb/state_abbrev_fips.txt" %>%
#   fread()
#
# state.various <- "https://gist.githubusercontent.com/soodoku/4c6bbf529fab6ec0bc3576e829af7c5d/raw/de112cf11181bba4a40b7a8407f476841ce145e8/state_various.csv" %>%
#   fread()
#
# # make a vector in same order as state.abb
# state.icpsr <-
#   state.various[code %in% state.abb] %>%
#   select(icpsr) %>%
#   as.matrix() %>%
#   as.vector()
#
# state.fips <-
#   state.fips.raw[V2 %in% state.abb] %>%
#   select(V1) %>%
#   as.matrix() %>%
#   as.vector()
#
# # can we get ipums bpls as well?
# ipums_bpl <- "https://usa.ipums.org/usa-action/variables/BPL#codes_section" %>%
#   getURL()
#
# state.ipums.bpl <-
#   ipums_bpl %>%
#   str_extract(".*Mass.*") %>%
#   str_extract("\\[.*\\]") %>%
#   fromJSON() %>%
#   as.data.table() %>%
#   .[label %in% state.name] %>%
#   select(general_code) %>%
#   as.matrix() %>%
#   as.vector()
#
# # now we want to store state.fips, state.icpsr, and state.ipums.bpl in the package
# setwd("G:/dropbox/Research/_KnowledgeBase/jjfPkg")
#
# save(state.fips, file = "data/state.fips.rda")
# save(state.icpsr, file = "data/state.icpsr.rda")
# save(state.ipums.bpl, file = "data/state.ipums.bpl.rda")
