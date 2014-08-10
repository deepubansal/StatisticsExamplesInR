
######### t-Test #########################################
testResults<- t.test(sampleInterested$avg, mu=mu)
testResults
tvalue <- testResults[["statistic"]]
####### r-squared is the proportion of change in one variable explained by another variable #######
rsquared= (tvalue*tvalue)/((tvalue*tvalue)+n-1)

