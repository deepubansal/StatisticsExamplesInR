require("ggplot2")

m0 <- rnorm(n = 100)
m3 <- rnorm(n=200, mean = 6, sd = 1)
m03 <- data.frame(value=append(m0,m3))
write.csv(m03, file="bimodal.data")


qplot(x=value, data=m03, geom = "density")

rlnorm <- rlnorm(n = 400, meanlog = 1, sdlog = 0.5)
rlnorm<- data.frame(value=rlnorm)
qplot(x=value, data = rlnorm, geom="density")
write.csv(rlnorm, file="negativelySkewed.data")

exp <- rexp(n=1000,rate = 10)
qplot(x=value, data=data.frame(value=exp), geom = c("density"), adjust=0.5, xlim=c(0,0.6))

rno
