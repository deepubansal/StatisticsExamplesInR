#######################z-test Example#####################################

rawData <- read.csv("Statistical Data (Responses) - Form Responses 1.csv")
rawData <- subset(rawData, select = c("Score1", "Score2", "Inclination"))

########## Add a new column "avg" in the dataset ##########
rawData$avg <- rowMeans(subset(rawData, select = c("Score1", "Score2")), na.rm = T)
func1 <- function(x) { 
  if (x <= 10)  
    x= x*10
  x
}
###### convert avg scores "out of 10" into "out of 100" #############
rawData$avg <- sapply(X = rawData$avg, FUN = func1)
####### population mean#####
mu <- mean(rawData$avg)
#######  population standard deviation #######
sigma <- sd(rawData$avg)

####### take sample size of 10 #########
n <- 10

###### All interested people ##########
interestedRawData <- rawData[rawData$Inclination=='Yes',]

##### take a sample of size 10 of interested people #######
sampleInterested <- interestedRawData[sample(nrow(interestedRawData), n),]

sampleError <- sigma/sqrt(n)

#For a two tailed Significance level of 95%, we will have 2.5% in each tail. So taking quantile of 0.975.
marginError <- qnorm(0.975)*sampleError;
confidenceInterval <- c(mu-marginError, mu + marginError)
sampleMean <- mean(sampleInterested$avg)

## Since confidence interval does contain the value sample mean, we fail to reject Null hpthosesis.
