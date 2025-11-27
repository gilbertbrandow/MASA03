set.seed(123)

n  <- 200
mu <- 0 
N  <- 100000

reject <- logical(N)

for (i in 1:N) {
  x        <- rnorm(n, mean = mu, sd = 1)
  t.hat    <- mean(x)
  teststat <- t.hat / (1 / sqrt(n))
  reject[i] <- abs(teststat) > qnorm(0.975)
}

mean(reject)

