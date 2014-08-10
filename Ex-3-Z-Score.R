
####################### z-score ########################################  
library("ggplot2")
facebook_pop <- rnorm(n= 10000, 190, 36)
twitter_pop <- rnorm(n = 10000, 208, 60)
total_pop <- data.frame(value=facebook_pop, type="facebook")
total_pop <- rbind.data.frame(total_pop, data.frame(value=twitter_pop, type="twitter"))

qplot(x = value, data = total_pop, geom="density", color=type)


########### comparison goes here ############################
zscore_facebook = (63 - mean(facebook_pop))/sd(facebook_pop)
zscore_twitter = (54 - mean(twitter_pop))/sd(twitter_pop)
