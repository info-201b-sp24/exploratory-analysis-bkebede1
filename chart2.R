library("dplyr")
library("ggplot2")
library("plotly")
library("readr")
setwd("C:\\Users\\Binyam\\Downloads")
stats <- read.csv("stats_dataset.csv")
stats <- stats %>% replace(is.na(.), 0)
main_stats <- stats %>% 
  select(26, 21, 22, 23, 24, 20)

averages <- colMeans(main_stats)
averages <- round(averages, digits = 2)
averages <- as.data.frame(averages)
names <- row.names(averages)
avg <- cbind(as.data.frame(averages), as.data.frame(names))

ggplot(avg, aes(x=names, y=averages,fill=names)) + geom_bar(stat="identity") + labs( y="Average") + 
  ggtitle("Average Stats in the NBA & WNBA") + geom_text(aes(label=averages),position="stack",vjust=1)
