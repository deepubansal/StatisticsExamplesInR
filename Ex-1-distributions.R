require("ggplot2")

bimodal.data <- read.csv(file = "bimodal.data")
qplot(x=value, data=bimodal.data, geom = "density")

negativelySkewed.data <- read.csv("negativelySkewed.data")
qplot(x=value, data = negativelySkewed.data, geom="density")

marksData<- scan(file = "datafile.txt", sep = ",")
qplot(marksData, geom="density")
