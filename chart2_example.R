library(dplyr)
library(tidyverse)
library(ggplot2)
library(scales)
library(RColorBrewer)
df <- read.csv("Checkouts_by_Title.csv", stringsAsFactors = F)
newdf <- df %>% filter (str_detect(Title, "Harry Potter"))
refined <- newdf %>% group_by(CheckoutYear) %>% summarise(Checkouts = sum(Checkouts))

refined$Checkouts[19] <- refined$Checkouts[19]*12

ggplot(data=refined, aes(x=CheckoutYear, y=Checkouts, group=1)) +
  geom_line()+
  geom_point() + ggtitle("Checkouts of Harry Potter material since 2005") + xlab("Checkout Year") 

