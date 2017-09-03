# Readme
## feigenbaum
## 9aug2017

Simple set of personal R functions. I like this better than my .Rprofile because I can keep it synced over many devices easier.

### To Do

- Get the custom fonts working on PC and NBER server
  - Currently only working with Macbook Air
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

```
