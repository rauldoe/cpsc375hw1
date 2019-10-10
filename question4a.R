#install.packages("ggplot2")
#install.packages("tidyverse")
library(ggplot2)
library(tidyverse)


cat("\014")
#setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kdo.THENEXTUPDEV2/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kd/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
data <- read.csv("horse_racing.csv")

token1 <- 'LICENSE # '
tLength1 <- nchar(token1)

token2 <- 'RECEIPT # '
tLength2 <- nchar(token2)

newValue1 = 'License'
newValue2 = 'Receipt'

horse <- data %>% 
    mutate(LicenseOrReceipt = factor(ifelse((substr(as.character(License), start = 1, stop = tLength1)==token1), newValue1, newValue2))) %>%
  mutate(Number = as.numeric(ifelse(LicenseOrReceipt == newValue1, substr(as.character(License), tLength1, nchar(as.character(License))), substr(as.character(License), tLength2, nchar(as.character(License)))))) 
View(horse)

str(horse)
