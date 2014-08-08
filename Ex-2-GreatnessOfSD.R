########################Standard Deviation Greatness#################
sd <- sd(m3)
mean <- mean(m3)
oneSdPositive <- mean +sd
oneSdNegative <- mean -sd

length(m3[m3 < oneSdPositive & m3 > oneSdNegative])/length(m3)

twoSdPositive <- mean + 2 * sd
twoSdNegative <- mean - 2 * sd

length(m3[m3 <= twoSdPositive & m3 >= twoSdNegative])/length(m3)

#########################################################################
