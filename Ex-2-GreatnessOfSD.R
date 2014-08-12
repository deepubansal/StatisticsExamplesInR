########################Standard Deviation Greatness#################
library(ggplot2)
m3 <- rnorm(n=2000, mean = 6, sd = 3)
head(m3)
sd <- sd(m3)
mean <- mean(m3)
oneSdPositive <- mean +sd
oneSdNegative <- mean -sd
qplot(m3)
length(m3[m3 < oneSdPositive & m3 > oneSdNegative])/length(m3)

twoSdPositive <- mean + 2 * sd
twoSdNegative <- mean - 2 * sd

length(m3[m3 <= twoSdPositive & m3 >= twoSdNegative])/length(m3)

#########################################################################
