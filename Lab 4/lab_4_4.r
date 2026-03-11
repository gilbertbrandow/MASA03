dat <- read.table("data.txt", header = TRUE)

bmi_male <- dat$BMI[dat$SEX == 1]
bmi_female <- dat$BMI[dat$SEX == 2]

bmi_male <- bmi_male[!is.na(bmi_male)]
bmi_female <- bmi_female[!is.na(bmi_female)]

t_res <- t.test(bmi_male, bmi_female)
ks_res <- ks.test(bmi_male, bmi_female)

print(t_res)
print(ks_res)

par(mfrow = c(2, 2))

hist(bmi_male,
  col = rgb(0, 0, 1, 0.4),
  xlim = range(c(bmi_male, bmi_female)),
  main = "BMI distribution by sex",
  xlab = "BMI"
)

hist(bmi_female,
  col = rgb(1, 0, 0, 0.4),
  add = TRUE
)

legend("topright",
  legend = c("Male", "Female"),
  fill = c(rgb(0, 0, 1, 0.4), rgb(1, 0, 0, 0.4))
)

boxplot(bmi_male, bmi_female,
  names = c("Male", "Female"),
  main = "BMI by sex",
  ylab = "BMI",
  col = c("lightblue", "salmon")
)

plot(ecdf(bmi_male),
  col = "blue",
  main = "Empirical CDF of BMI",
  xlab = "BMI",
  ylab = "ECDF"
)

lines(ecdf(bmi_female), col = "red")

legend("bottomright",
  legend = c("Male", "Female"),
  col = c("blue", "red"),
  lwd = 2
)

qqplot(bmi_male, bmi_female,
  xlab = "Male BMI quantiles",
  ylab = "Female BMI quantiles",
  main = "QQ comparison of BMI distributions"
)
abline(0, 1, col = "red")

par(mfrow = c(1, 1))