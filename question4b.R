#install.packages("ggplot2")
#install.packages("tidyverse")
library(ggplot2)
library(tidyverse)

cat("\014")
#setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kdo.THENEXTUPDEV2/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kd/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")

data <- read.csv("language_diversity.csv")

tidyData <- spread(data, key = Measurement, value = 'Value')

str(tidyData)