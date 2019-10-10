#install.packages("ggplot2")
library(ggplot2)
#setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
survey <- read.csv("survey2019.csv")

ilist = survey$plan_CPSC_483
breaklist = levels(ilist)
labellist = c("Dont Know", "No", "Yes")

#bar graph
p <- ggplot(data = survey)
barGraph = 
  p +
  geom_bar(mapping=aes(x=ilist)) +
  ggtitle("Q1 Survey of Students Who Plan to Take CPSC 483") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Answers") + 
  ylab("# of Students") +
  scale_x_discrete(breaks=breaklist, labels=labellist, limits=breaklist)

pdf("question2c_graph.pdf")
print(barGraph)
dev.off()


