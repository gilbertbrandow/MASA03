n <- 100
mu <- 2
s2 <- 1

x <- rnorm(10, mu, s2)
qqnorm(x)
qqline(x)

x <- rnorm(20, mu, s2)
qqnorm(x)
qqline(x)

x <- rnorm(200, mu, s2)
qqnorm(x)
qqline(x)

x <- rnorm(1000, mu, s2)
qqnorm(x)
qqline(x)

m <- 200
n <- 10
x <- rexp(n * m)
x2 <- matrix(x, m, n)
x_n <- apply(x2, 1, mean)
qqnorm(x_n)
qqline(x_n)

n <- 20
x <- rexp(n * m)
x2 <- matrix(x, m, n)
x_n <- apply(x2, 1, mean)
qqnorm(x_n)
qqline(x_n)

n <- 200
x <- rexp(n * m)
x2 <- matrix(x, m, n)
x_n <- apply(x2, 1, mean)
qqnorm(x_n)
qqline(x_n)

n <- 1000
x <- rexp(n * m)
x2 <- matrix(x, m, n)
x_n <- apply(x2, 1, mean)
qqnorm(x_n)
qqline(x_n)


n <- 10
m <- 200
nn <- 3
pp <- 0.5
x <- rbinom(n * m, nn, 0.1)
x2 <- matrix(x, m, n)
x_n <- apply(x2, 1, mean)
qqnorm(x_n)
qqline(x_n)

n <- 50
x <- rbinom(n * m, nn, 0.1)
x2 <- matrix(x, m, n)
x_n <- apply(x2, 1, mean)
qqnorm(x_n)
qqline(x_n)

n <- 200
x <- rbinom(n * m, nn, 0.1)
x2 <- matrix(x, m, n)
x_n <- apply(x2, 1, mean)
qqnorm(x_n)
qqline(x_n)