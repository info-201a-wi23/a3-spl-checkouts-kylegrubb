library(dplyr)
library(tidyverse)
library(ggplot2)
library(scales)
library(RColorBrewer)
df <- read.csv("Checkouts_by_Title.csv", stringsAsFactors = F)
newdf1 <- df %>% filter (MaterialType == c("AUDIOBOOK", "BOOK"))
refined1<- newdf1 %>% group_by(MaterialType, CheckoutYear)  %>% summarise(Checkouts = sum(Checkouts))
refined1$Checkouts[38] <- refined1$Checkouts[38] * 12
refined1$Checkouts[19] <- refined1$Checkouts[19] * 12
ratio1 <- refined1$Checkouts[9]/refined1$Checkouts[28]
ratio2 <- refined1$Checkouts[19]/refined1$Checkouts[38]
options(scipen = 999)
ggplot(refined1, aes(fill=MaterialType, y=Checkouts, x=CheckoutYear))+ 
         geom_bar(position="stack", stat="identity") + ggtitle("Number of Books and Audiobooks checked out since 2005") + ylab("Number of Checkouts") + xlab("Checkout Year") + scale_fill_brewer(palette = "Dark2")
         