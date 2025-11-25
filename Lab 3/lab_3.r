n <- 200
mu <- 2
n <- 200
x <- rnorm(n, mean = mu, sd = 1)

mu_hat <- mean(x)
error <- qnorm(0.975) * 1 / sqrt(n)
left <- mu_hat - error
right <- mu_hat + error

n <- 1000
count <- 0
for (i in (1:n)) {
  x <- rnorm(n, mean = mu, sd = 1)
  mu_hat <- mean(x)
  error <- qnorm(0.975) * 1 / sqrt(n)
  left <- mu_hat - error
  right <- mu_hat + error
  count <- count + as.double(left <= mu & mu <= right)
}