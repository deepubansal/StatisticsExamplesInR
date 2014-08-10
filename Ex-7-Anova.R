
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


############### Effect of 10 new values("None") on DataSet with avg marks 99 ###############
temRawData <- rawData
temRawData$Inclination <- factor(temRawData$Inclination, levels=c("Yes", "No", "None"))
temRawData <- rbind(temRawData, c(99,99,'None',99))
temRawData<-rbind(temRawData,temRawData[rep(45, 9),])
temRawData$avg <- as.numeric(temRawData$avg)

newFit<- aov(avg ~ Inclination, data = temRawData)
summary(newFit)
TukeyHSD(newFit)
###############################################################################################

