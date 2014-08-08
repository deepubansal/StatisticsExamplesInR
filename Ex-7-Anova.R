
############################ One Way - Anova###############################################


rawData <- read.csv("Statistical Data (Responses) - Form Responses 1.csv")
rawData <- subset(rawData, select = c("Score1", "Score2", "Inclination"))
rawData$avg <- rowMeans(subset(rawData, select = c("Score1", "Score2")), na.rm = T)
func1 <- function(x) { 
  if (x <= 10)  x= x*10
  x
}
rawData$avg <- sapply(X = rawData$avg, FUN = func1) 

fit<- aov(avg ~ Inclination, data = rawData)
summary(fit)
TukeyHSD(fit)
aggregate(avg ~ Inclination, rawData, mean)

