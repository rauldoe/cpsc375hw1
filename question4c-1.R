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


sh<-top_n(data, 1)

sh %>% mutate()