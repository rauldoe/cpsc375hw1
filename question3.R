#install.packages("ggplot2")
#install.packages("tidyverse")
library(ggplot2)
library(tidyverse)

#setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
#setwd("C:/Users/kdo.THENEXTUPDEV2/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
survey <- read.csv("survey2019.csv")

#a.	List data only for students with skill in CS > 7
cat("\014")
survey %>% filter(CS > 7)
# OR survey[survey$CS > 7,]

#b.	List data only for students with skill in CS > 7 and skill in Math > 5
cat("\014")
survey %>% filter(CS > 7, Math > 5)

#c.	List data only for students with either skill in CS > 7 or skill in Math > 5
survey %>% filter(CS > 7 | Math > 5)

#d.	List data only for students who are CS majors.
cat("\014")
survey %>% filter(CSmajor. == "Yes")

#e.	Sort data in order of increasing Statistics skill
cat("\014")
survey %>% arrange(Statistics)

#f.	Sort data in order of decreasing Statistics skill
cat("\014")
survey %>% arrange(desc(Statistics))

# TODO: CS major
# . and end
#g.	Show only the Semester and CS major of students in order of decreasing Statistics skill
cat("\014")
survey %>% arrange(desc(Statistics)) %>% select(Semester, CSmajor.)

#h.	Add a new variable, Math_Statistics, that indicates the total Math + Statistics skill
cat("\014")
survey %>% mutate(Math_Statistics=Math+Statistics)

# TODO: CS major
#i.	Show only the Semester and CS major of students in order of decreasing Math_Statistics skill
cat("\014")
survey %>% mutate(Math_Statistics=Math+Statistics) %>% arrange(desc(Math_Statistics)) %>% select(Semester, CSmajor.)

#j.	Show only the Semester and CS major of students with 10 highest Statistics skill (Hint: use the min_rank() function which assigns ranks 1, 2, 3, .)
cat("\014")
survey %>% arrange(desc(Statistics)) %>% head(10) %>% select(Semester, 'CSmajor.') 

#k.	Show the average Math_Statistics skill for every Semester.
cat("\014")
survey %>% 
  mutate(Math_Statistics=Math+Statistics) %>%
  group_by(Semester) %>%
  summarise(average=mean(Math_Statistics))

#l.	Show the average Math_Statistics skill for every Semester-CS major pair
cat("\014")
survey %>% 
  mutate(Math_Statistics=Math+Statistics) %>%
  group_by(Semester, CSmajor.) %>%
  summarise(average=mean(Math_Statistics))

