#install.packages("ggplot2")
#install.packages("tidyverse")
library(ggplot2)
library(tidyverse)

#setwd("/Users/mikedo/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_375_data_science/hw1")
survey <- read.csv("survey2019.csv")

seq <- 1:10
mathList = survey %>% group_by(Math) %>% summarise(Count=n()) %>% mutate(Item=Math, Discipline="Math") %>% select(Item, Count, Discipline) %>% arrange(Item)
#mathList <- mathList %>% complete(Item = seq, fill = list(Count = 0, Discipline="Math"))
csList = survey %>% group_by(CS) %>% summarise(Count=n()) %>% mutate(Item=CS, Discipline="CS") %>% select(Item, Count, Discipline) %>% arrange(Item)
#csList <- csList %>% complete(Item = seq, fill = list(Count = 0, Discipline="CS"))

#totalList <- merge(mathList, csList, by="Item")
totalList <- bind_rows(mathList, csList)

#scatter plot
p <- ggplot(data = totalList)
graph = 
  p +
  geom_point(mapping=aes(x=totalList$Item, y=totalList$Count, colour=totalList$Discipline)) +
  ggtitle("Q1 Survey of Students With Their Levels of Math and CS") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Skill Levels") + 
  ylab("# of Students") +
  scale_x_discrete(breaks=totalList$Item, labels=as.character(totalList$Item), limits=totalList$Item) +
  theme(legend.position = c(0.95, 0.95), legend.justification = c("right", "top")) +
  scale_color_discrete(name = "Discipline")
  #guides(color=guide_legend(title="New Legend Title Guides"))
  #labs(color="NEW LEGEND TITLE labs") 

pdf("question2d_graph.pdf")
print(graph)
dev.off()

