library("tidyverse")
library("dplyr")
library("plotly")
library("readr")

setwd("C:\\Users\\Binyam\\Downloads")
stats <- read.csv("stats_dataset.csv")
stats <- stats %>% replace(is.na(.), 0)

stats_summary <- stats %>% 
  group_by(Pos) %>% 
  summarize(
    mean_ppg = mean(PTS),
    mean_ast = mean(AST),
    mean_stl = mean(STL),
    mean_trb = mean(TRB),
    mean_tov = mean(TOV)
  )
stats_summary
