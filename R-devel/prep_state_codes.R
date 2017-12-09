#prep_state_codes.R
#feigenbaum
#3nov2017

library(data.table)
library(tidyverse)
library(RCurl)
library(jsonlite)
library(stringr)
library(magrittr)
library(htmltab)

# load the state fips data and icpsr (in various) from Soodoku's gists

raw_statefips <- "https://gist.githubusercontent.com/soodoku/f9e18efe98f7d74931d8b4a79a49e6f5/raw/891f0ca1c84fb64c3aa8950f7e21c79b117402bb/state_abbrev_fips.txt" %>%
  fread()

raw_statevarious <- "https://gist.githubusercontent.com/soodoku/4c6bbf529fab6ec0bc3576e829af7c5d/raw/de112cf11181bba4a40b7a8407f476841ce145e8/state_various.csv" %>%
  fread()

# make a vector in same order as state.abb
state.icpsr <-
  raw_statevarious[code %in% state.abb] %>%
  select(icpsr) %>%
  as.matrix() %>%
  as.vector()

state.fips <-
  raw_statefips[V2 %in% state.abb] %>%
  select(V1) %>%
  as.matrix() %>%
  as.vector()

# can we get ipums bpls as well?
ipums_bpl <- "https://usa.ipums.org/usa-action/variables/BPL#codes_section" %>%
  getURL()

state.ipums.bpl <-
  ipums_bpl %>%
  str_extract(".*Mass.*") %>%
  str_extract("\\[.*\\]") %>%
  fromJSON() %>%
  as.data.table() %>%
  .[label %in% state.name] %>%
  select(general_code) %>%
  as.matrix() %>%
  as.vector()

# add a few more history vectors
state.confederacy <- state.abb %>% str_detect("AL|MS|GA|FL|LA|TX|AR|TN|NC|SC|VA")
state.union <- state.abb %>% str_detect("CA|OR|KS|MO|IA|MN|WI|MI|IL|IN|OH|KY|MD|DE|PA|NJ|NY|VT|NH|ME|MA|CT|RI")
state.civilwar <-
  cbind(state.confederacy, state.union) %>%
  as_tibble() %>%
  mutate(state.civilwar = case_when(state.confederacy == TRUE ~ "confederacy",
                                    state.union == TRUE ~ "union",
                                    state.confederacy == FALSE & state.union == FALSE ~ "territory")) %>%
  select(state.civilwar) %>%
  as.matrix() %>%
  as.vector()
state.slavery.1860 <- state.abb %>% str_detect("AL|MS|GA|FL|LA|TX|AR|TN|NC|SC|VA|MO|KY|WV|MD|DE")
state.13.colony <- state.abb %>% str_detect("DE|PA|MA|NJ|GA|CT|MD|SC|NH|VA|NY|NC|RI")

# date of admission
state.admission <-
    htmltab(doc = "https://en.wikipedia.org/wiki/List_of_U.S._states_by_date_of_admission_to_the_Union", which = 1) %>%
    as.data.table() %>%
    setnames(c("state_num", "state", "date_admitted", "formed")) %>%
    as_tibble() %>%
    select(state, date_admitted) %>%
    mutate(state = state %>% str_extract("[A-Za-z ]+") %>% str_trim()) %>%
    mutate(date_admitted = date_admitted %>% str_replace("\\(.*\\)", "")) %>%
    filter(state %in% state.name) %>%
    arrange(state) %>%
    select(state.admissiondate = date_admitted) %>%
    as.matrix() %>%
    as.vector()

# now we want to store state.fips, state.icpsr, and state.ipums.bpl and the rest in the package
setwd("G:/dropbox/Research/_KnowledgeBase/jjfPkg")

out <- ls(pattern = "^state")

for (s in out) {

  f_out <- sprintf("data/%s.rda", s)

  save(list = s, file = f_out)

}
