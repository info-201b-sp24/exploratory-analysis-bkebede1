library("dplyr")
library("ggplot2")
library("plotly")
library("readr")
setwd("C:\\Users\\Binyam\\Downloads")
stats <- read.csv("stats_dataset.csv")
stats <- stats %>% replace(is.na(.), 0)

nba_stats <- stats[1:735,]
nba_main_stats <- nba_stats %>% 
  select(26, 21, 22, 23, 24, 20)
averages <- colMeans(nba_main_stats)
averages <- round(averages, digits = 2)
averages <- as.data.frame(averages)

wnba_stats <- stats[735:910,]
wnba_main_stats <- wnba_stats %>% 
  select(26, 21, 22, 23, 24, 20)
wnba_averages <- colMeans(wnba_main_stats)
wnba_averages <- round(wnba_averages, digits = 2)
names <- row.names(averages)
nba_avg <- cbind(as.data.frame(averages), as.data.frame(names))
wnba_avg <- cbind(as.data.frame(wnba_averages), as.data.frame(names))
names(wnba_avg) <- names(nba_avg)
avg <- rbind(
mutate(nba_avg, group = "NBA"),
mutate(wnba_avg, group = "WNBA")
)

rownames(avg) <- NULL


ggplot(avg, aes(x=names, y=averages ,fill=group)) + geom_bar(stat="identity", position = position_dodge()) + 
  labs(x = "Stats", y="Average") + ggtitle("Average Stats: NBA vs WNBA") 

