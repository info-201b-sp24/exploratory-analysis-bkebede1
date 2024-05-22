library("dplyr")
library("ggplot2")
library("plotly")
library("readr")
setwd("C:\\Users\\Binyam\\Downloads")
stats <- read.csv("stats_dataset.csv")
stats <- stats %>% replace(is.na(.), 0)
fg <- stats %>% 
  select(3, 9)
FG <- list(fg$Pos)
y <- aggregate(FG.~Pos, data = fg, FUN=mean)

ggplot(y, aes(x=Pos, y=FG.,fill=Pos)) + geom_bar(stat="identity") + labs(x="Positions", y="FG%") + ggtitle("Field Goal Percentage by Position")

