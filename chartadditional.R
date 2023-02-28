library(dplyr)
library(tidyverse)
library(ggplot2)
library(scales)
library(RColorBrewer)
df <- read.csv("Checkouts_by_Title.csv", stringsAsFactors = F)
refined5 <- df %>% group_by(Publisher) %>% summarise(sum(Checkouts))
refined5 <- refined5[order(-refined5[2]),]
num <- sum(refined5$`sum(Checkouts)`)
refined6 <- refined5[-1,]
refined7 <- head(refined6,10)
ratio3 <-  sum(refined7[2])
ratio3 <- ratio3/num
options(scipen = 999)
colnames(refined7)[2] <- "Checkouts"
ggplot(refined7, aes(x="", y=Checkouts, fill=Publisher)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) + theme_void() +labs(title = "Checkouts of 10 Largest 10 Publishers at SPL", subtitle = "Representation of the 10 largest publishers at SPL, making up 16% of checkouts.")


