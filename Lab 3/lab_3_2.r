set.seed(123)

n     <- 300
mu    <- 2
sigma <- 2
sigma2 <- sigma^2

x <- rnorm(n, mean = mu, sd = sigma)
sigma2_hat <- var(x)

left  <- (n-1) * sigma2_hat / qchisq(0.975, df = n-1)
right <- (n-1) * sigma2_hat / qchisq(0.025, df = n-1)

c(left, right)

N <- 50000
cover <- logical(N)

for (i in 1:N) {
  x <- rnorm(n, mean = mu, sd = sigma)
  sigma2_hat <- var(x)

  left  <- (n - 1) * sigma2_hat / qchisq(0.975, df = n - 1)
  right <- (n - 1) * sigma2_hat / qchisq(0.025, df = n - 1)

  cover[i] <- (left <= sigma2 && sigma2 <= right)
}

mean(cover)
sum(cover)

running <- cumsum(cover) / (1:N)

plot(1:N, running, type = "l",
     xlab = "Number of simulations N",
     ylab = "Proportion of intervals covering sigma^2")
abline(h = 0.95, lty = 2)
