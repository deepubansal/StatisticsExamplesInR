########################################### correlation & Regression ############################

library('ggplot2')

rawData <- read.csv("Statistical Data (Responses) - Form Responses 1.csv")
rawData <- subset(rawData, select = c("Score1", "Score2", "Inclination"))
func1 <- function(x) { 
  if (is.na(x) ==  F && x <= 10)  x= x*10
  x
}
rawData$Score1 <- sapply(X = rawData$Score1, FUN = func1) 
rawData$Score2 <- sapply(X = rawData$Score2, FUN = func1) 
rawData$avg <- rowMeans(subset(rawData, select = c("Score1", "Score2")), na.rm = T)

qplot(x = Score1, y= Score2, data = rawData, geom = "point" )
r <- cor(rawData$Score1, rawData$Score2, use = "pairwise.complete.obs", method="pearson")

############## correlation- hpothesis testing##########################
cor.test(rawData$Score1, rawData$Score2)
############## Regression - line of best fit #####################
regModel<-lm(Score1~Score2, rawData)

################ Drawing regression line on plot#############################
qplot(x = Score1, y= Score2, data = rawData, geom = "point" ) + geom_abline(coef = regModel[["coefficients"]] )

################ Testing Regression ######################
summary(regModel)
##################################################################################################################
