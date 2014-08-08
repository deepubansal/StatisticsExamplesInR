
###########################2-sample (Independent) t-test###################################


rawData <- read.csv("Statistical Data (Responses) - Form Responses 1.csv")
rawData <- subset(rawData, select = c("Score1", "Score2", "Inclination"))
rawData$avg <- rowMeans(subset(rawData, select = c("Score1", "Score2")), na.rm = T)
func1 <- function(x) { 
  if (x <= 10)  x= x*10
  x
}
rawData$avg <- sapply(X = rawData$avg, FUN = func1) 

###############long way############
sampleYes <- rawData[rawData$Inclination=='Yes',]
sampleNo <- rawData[rawData$Inclination=='No',]
t.test(sampleYes$avg, sampleNo$avg)
###############short way##########
t.test(formula = avg~Inclination, data = rawData)
