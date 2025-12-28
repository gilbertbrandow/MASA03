confidence_interval <- function(n) {
  x <- rexp(n)
  teta_hat <- mean(exp(-x))
  sigma_hat <- sd(exp(-x))
  error <- qnorm(0.975) * sigma_hat / sqrt(n)
  left <- teta_hat - error
  right <- teta_hat + error

  c(left, right)
}

N <- 5000 # nolint: object_name_linter
n <- 200
theta <- 0.5

covered <- logical(N)

for (i in 1:N) {
  ci <- confidence_interval(n)
  covered[i] <- (ci[1] <= theta && theta <= ci[2])
}

running_cov <- cumsum(covered) / seq_len(N)

plot(
  seq_len(N), running_cov,
  type = "l",
  xlab = "Number of repetitions (N)",
  ylab = "Running coverage proportion",
  main = sprintf("Running coverage for 95%% CI (n = %d)", n),
  ylim = c(0.85, 1.00)
)


abline(h = 0.95, lty = 2)
abline(h = mean(covered), lty = 3)

legend(
  "bottomright",
  legend = c(
    "Running coverage",
    "Nominal 0.95",
    sprintf("Final at N=%d: %.3f", N, mean(covered))
  ),
  lty = c(1, 2, 3),
  bty = "n"
)

mean(covered)