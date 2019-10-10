#install.packages("ggplot2")
library(ggplot2)

#setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
survey <- read.csv("survey2019.csv")

#bar graph
p <- ggplot(data = survey)
barGraph = 
  p +
  geom_bar(mapping=aes(x=survey$CS))

pdf("question2a_graph.pdf")
print(barGraph)
dev.off()
