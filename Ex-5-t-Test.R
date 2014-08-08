
######### t-Test #########################################
testResults<- t.test(sampleInterested$avg, mu=mu)
tvalue <- testResults[["statistic"]]
rsquared= (tvalue*tvalue)/((tvalue*tvalue)+n-1)
qplot(x = avg, data = rawData, geom= "histogram", binwidth=5)
