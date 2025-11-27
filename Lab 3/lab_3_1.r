set.seed(123)
n  <- 200
mu <- 2
N  <- 100000

cover <- logical(N)

for (i in 1:N) {
  x      <- rnorm(n, mean = mu, sd = 1)
  mu_hat <- mean(x)
  error  <- qnorm(0.975) * 1 / sqrt(n)
  CI     <- c(mu_hat - error, mu_hat + error)
  cover[i] <- (CI[1] <= mu && mu <= CI[2])
}

running_prop <- cumsum(cover) / (1:N)

plot(1:N, running_prop, type = "l",
     xlab = "Number of simulations N",
     ylab = "Proportion covering mu")
abline(h = 0.95, lty = 2)