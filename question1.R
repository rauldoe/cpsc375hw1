#a
#setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
survey <- read.csv("survey2019.csv")

#b
str(survey)

#c
semester <- factor(survey$Semester)

#d
mean(survey$Math)

#e
mean(survey$Statistics)

#f
mean(survey[survey$Semester == "Fall",]$Math)

#g
mean(survey[survey$Semester == "Spring",]$Math)

#h
nrow(survey[survey$taken_CPSC_483 == "Yes",])