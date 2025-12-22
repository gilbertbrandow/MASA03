df <- read.table("data.txt", header = TRUE, quote = "\"")

ecdf_all <- ecdf(df$BMI)
ecdf_g1  <- ecdf(df$BMI[df$g1 == 1])
ecdf_g0  <- ecdf(df$BMI[df$g1 == 0])

plot(ecdf_all,
     xlim = c(0, 80),
     col = "black",
     lwd = 2,
     main = "ECDF of BMI",
     xlab = "BMI",
     ylab = "ECDF")

lines(ecdf_g1, col = "red",  lwd = 2)
lines(ecdf_g0, col = "blue", lwd = 2)

legend("bottomright",
       legend = c("All", "g1 = 1", "g1 = 0"),
       col = c("black", "red", "blue"),
       lwd = 2)
