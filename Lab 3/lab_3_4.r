
numbers <- list(25, 200, 1000)

par(mfrow = c(1, 3))

for (n in numbers) {
  theta_points <- seq(-2, 2, length.out = 1000)
  power <- 1 - (
    pnorm(qnorm(0.975) - theta_points * sqrt(n))
    - pnorm(qnorm(0.025) - theta_points * sqrt(n))
  )

  plot(
    theta_points,
    power,
    type = "l",
    xlab = "theta",
    ylab = "power",
    main = paste("n =", n),
  )
}

par(mfrow = c(1,1))