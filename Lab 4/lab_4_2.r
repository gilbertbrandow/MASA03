confidence_interval <- function(n) {
  x <- rexp(n)
  teta_hat <- mean(exp(-x))
  sigma_hat <- sd(exp(-x))
  error <- qnorm(0.975) * sigma_hat / sqrt(n)
  left <- teta_hat - error
  right <- teta_hat + error

  c(left, right)
}


confidence_interval(200)
confidence_interval(1000)