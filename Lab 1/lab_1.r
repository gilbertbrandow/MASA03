data1 <- rnorm(100, mean = 1, sd = sqrt(2))

hist(data1, 
     main = "N(1,2)", 
     xlab = "Value",
     border = "black",
     breaks = 20
)

data2 <- rnorm(1000, mean = 0, sd = 1)
data3 <- rnorm(1000, mean = 0, sd = sqrt(2))
data4 <- rnorm(1000, mean = 0, sd = sqrt(3))

par(mfrow = c(1,3))
xlim <- c(-6, 6)
ylim <- c(0, 250)

hist(data2, xlim = xlim, ylim = ylim, main = "N(0,1)", xlab = "Value", border = "black", breaks = 20)
hist(data3, xlim = xlim, ylim = ylim, main = "N(0,2)", xlab = "Value", border = "black", breaks = 20)
hist(data4, xlim = xlim, ylim = ylim, main = "N(0,3)", xlab = "Value", border = "black", breaks = 20)
