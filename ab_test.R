library(dplyr)
library(gmodels)
library(corrgram)
library(corrplot)
library(ggplot2)
library(PerformanceAnalytics)
library(readr)
library(ggpubr)
library(tseries)


df <- read_csv("C:/Users/Guilherme Lupatelli/Desktop/Data Science/Projects/Free Now/driver_campaign.csv")
df <- freenow_driver_campaign

#Normality Jarque Bera Test

sampled_df <- df[sample(nrow(df), 10000), ]
jarque.bera.test(sampled_df[sampled_df$test_group == 'A',]$rides_within_week)
jarque.bera.test(sampled_df[sampled_df$test_group == 'B',]$rides_within_week)
hist(sampled_df$rides_within_week)
ggqqplot(sampled_df$rides_within_week)

summary(sampled_df[sampled_df$test_group == 'A',]$rides_within_week)
summary(sampled_df[sampled_df$test_group == 'B',]$rides_within_week)

t.test(sampled_df[sampled_df$test_group == 'B',]$rides_within_week, sampled_df[sampled_df$test_group == 'A',]$rides_within_week, alternative = c('greater'))

mean(sampled_df[sampled_df$test_group == 'A',]$rides_within_week)
mean(sampled_df[sampled_df$test_group == 'B',]$rides_within_week)

hgA <- hist(sampled_df[sampled_df$test_group == 'A',]$rides_within_week, plot = FALSE) # Save first histogram data
hgB <- hist(sampled_df[sampled_df$test_group == 'B',]$rides_within_week, plot = FALSE) # Save 2nd histogram data

plot(hgA, col=rgb(0,0,1,0.5)) # Plot 1st histogram using a transparent color
plot(hgB, col=rgb(1,0,0,0.5), add = TRUE) # Add 2nd histogram using different color

