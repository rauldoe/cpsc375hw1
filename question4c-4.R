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
#setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kdo.THENEXTUPDEV2/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kd/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")

data <- read_csv("diseases.csv")

prefixKeys <- c("Patientdays", "Separations")
yearRanges <- c("Y2015-16", "Y2016-17")
delimiter <- "_"

fc <- function(i, j) paste(prefixKeys[i], yearRanges[j], sep = delimiter)
colSet1 <- c(fc(1, 1), fc(1, 2)) 
colSet2 <- c(fc(2, 1), fc(2, 2))

getDateRange <- function(pCol) substr(pCol, start=str_length(paste(prefixKeys[1], "_", collapse = "")), stop=length(pCol))

data1 <- data %>%
  gather(pKey, Patientdays, colSet1) %>% 
  gather(sKey, Separations, colSet2) %>%
  filter(
    (pKey == colSet1[1] & sKey == colSet2[1]) |
    (pKey == colSet1[2] & sKey == colSet2[2])
  ) %>%
  mutate(Year = getDateRange(pKey), Diseases = factor(Diseases), Year = factor(Year)) %>%
  select(Diseases, Year, Patientdays, Separations) %>%
  arrange(Diseases)

View(data1)
str(data1)

