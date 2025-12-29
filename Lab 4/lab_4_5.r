library(KernSmooth)
df <- read.table("data.txt", header = TRUE, quote = "\"")

x <- df$CHOL
x <- x[is.finite(x)]

h <- 0.1

kd <- bkde(x, bandwidth = h)

mu <- mean(x)
sigma <- sd(x)

plot(kd$x, kd$y, type = "l",
     xlab = "CHOL", ylab = "Density",
     main = sprintf("CHOL: KDE (bandwidth = %.2f) vs Gaussian fit", h))

lines(kd$x, dnorm(kd$x, mean = mu, sd = sigma), lty = 2)

legend("topright",
       legend = c(sprintf("KDE (h = %.2f)", h), "Gaussian N(mean, sd^2)"),
       lty = c(1, 2), bty = "n")


y <- df$CHOL
g <- df$SEX

ok <- is.finite(y) & !is.na(g)
y <- y[ok]
g <- droplevels(as.factor(g[ok]))

tt <- t.test(y ~ g)
tt

tapply(y, g, mean)
tapply(y, g, sd)
tapply(y, g, length)
