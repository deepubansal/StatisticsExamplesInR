#################### Chi-Sq ###########################################################3

rawData <- read.csv("Statistical Data (Responses) - Form Responses 1.csv")
rawData <- subset(rawData, select = c("Score1", "Score2", "Inclination"))
func1 <- function(x) { 
  if (is.na(x) ==  F && x <= 10)  x= x*10
  x
}
rawData$Score1 <- sapply(X = rawData$Score1, FUN = func1) 
rawData$Score2 <- sapply(X = rawData$Score2, FUN = func1) 


############# Chi-sq  Goodness of Fit of a nominal vector with values Yes and No #################
chisq.test(table(rawData$Inclination))


############# Effect of a new value ("None") on Chi-sq ###################
temRawData <- rawData
temRawData$Inclination <- factor(temRawData$Inclination, levels=c("Yes", "No", "None"))
temRawData <- rbind(temRawData, c(99,99,'None'))
chisq.test(table(temRawData$Inclination))

############### Effect of 10 new values("None") on Chi-sq ###############

temRawData<-rbind(temRawData,temRawData[rep(45, 10),])
chisq.test(table(temRawData$Inclination))

###############################################################################################


