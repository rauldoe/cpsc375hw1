#install.packages("ggplot2")
#install.packages("tidyverse")
#install.packages("pracma)
library(ggplot2)
library(tidyverse)
library(pracma)

#strsplit(d, " ")
#str_replace(l[length(l)], "([\[\]])", "")
#last_elems <- lapply(z, tail, n = 1L)
#first_elems <- lapply(z, head, n=1)
#gsub("cheap", "sheep's", "A wolf in cheap clothing")

cat("\014")
setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kdo.THENEXTUPDEV2/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kd/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")

data <- read_csv("diseases.csv")


NOT_REPORTED <- "Not reported"
PAREN_PATTERN <- "([\\(\\)])"

isNotReported <- function(list) (paste(list, collapse = " ") == NOT_REPORTED)
fixReportId <- function(item) if (isNotReported(item)) 0 else head(item, 1)
fixICD10 <- function(item) if (isNotReported(item)) "000-000" else gsub(PAREN_PATTERN, "", paste(tail(item, n=1)) )
fixDesc <- function(list) if (isNotReported(list)) NOT_REPORTED else paste(list[3:length(list)-1], collapse = " ")

diseases <- data %>% 
  select(Diseases) %>%
  mutate(descl = strsplit(as.character(Diseases), " ")) %>%
  mutate(
    ReportId = lapply(descl, fixReportId), 
    ICD10 = lapply(descl, fixICD10), 
    Desc = lapply(descl, fixDesc) 
  ) %>%
  select (ReportId, ICD10, Desc)
View(diseases)

