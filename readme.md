# Readme
## feigenbaum
## 9aug2017

Simple set of personal R functions. I like this better than my .Rprofile because I can keep it synced over many devices easier.

Custom fonts are still giving me trouble but I'm working on it.

### Install

```{r}
devtools::install_github("jamesfeigenbaum/jjfPkg")
```

### Build

```{r}
setwd("G:/Dropbox/Research/_KnowledgeBase/jjfPkg/")

devtools::document()
devtools::build()
devtools::check()
```

### To Do

- Add additional functions?
  - function to clear the workspace?
  - function to copy to clipboard my template to start an R file?
    - or my template for a Rmd?
- Make sure not to put anything private in here because the repo is public

### Test the theme

```{r}

library(tidyverse)
library(extrafont)
library(jjfPkg)

ggplot(cars, aes(x = dist, y = speed)) +
  geom_point() +
  theme_jjf()

# same as above, roboto Condensed is the default
ggplot(cars, aes(x = dist, y = speed)) +
  geom_point() +
  theme_jjf(font = "Roboto Condensed")

ggplot(cars, aes(x = dist, y = speed)) +
  geom_point() +
  theme_jjf(font = "CMU Sans Serif")

```

### How to use the state codes

```{r}

x <- c("New York", "Virginia")

state.fips[match(x, state.name)]
state.icpsr[match(x, state.name)]
state.ipums.bpl[match(x, state.name)]

```
