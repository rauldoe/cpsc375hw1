#install.packages("ggplot2")
library(ggplot2)
#setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
survey <- read.csv("survey2019.csv")

ilist = survey$CS
breaklist = c(1:max(ilist))
labellist = as.character(breaklist)
survey$CS <- factor(ilist)
#survey$CS <- as.integer(ilist)

#bar graph
p <- ggplot(data = survey)
barGraph = 
  p +
  geom_bar(mapping=aes(x=ilist)) +
  ggtitle("Q1 Survey of Students CS Skills") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Skill Level of CS") + 
  ylab("# of Students With Skill Level") +
  scale_x_discrete(breaks=breaklist, labels=labellist, limits=breaklist)

pdf("question2b_graph.pdf")
print(barGraph)
dev.off()
