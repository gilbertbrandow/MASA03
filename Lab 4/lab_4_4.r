run_tests <- function(df, vars, groups, min_n_per_group = 30) {
  results <- list()

  for (v in vars) {
    for (gr in groups) {

      y <- df[[v]]
      g <- df[[gr]]

      ok <- is.finite(y) & !is.na(g)
      y <- y[ok]
      g <- droplevels(as.factor(g[ok]))

      if (nlevels(g) < 2) next

      levs <- levels(g)
      pairs <- combn(levs, 2, simplify = FALSE)

      for (p in pairs) {
        g2 <- droplevels(g[g %in% p])
        y2 <- y[g %in% p]

        y1 <- y2[g2 == p[1]]
        yB <- y2[g2 == p[2]]

        n1 <- length(y1); n2 <- length(yB)
        if (n1 < min_n_per_group || n2 < min_n_per_group) next

        tt <- t.test(y2 ~ g2)
        mean1 <- mean(y1); mean2 <- mean(yB)
        diff12 <- unname(mean1 - mean2)

        ks <- suppressWarnings(ks.test(y1, yB))

        results[[length(results) + 1]] <- data.frame(
          variable = v,
          grouping = gr,
          group1 = p[1],
          group2 = p[2],
          n1 = n1,
          n2 = n2,
          mean1 = mean1,
          mean2 = mean2,
          mean_diff_1_minus_2 = diff12,
          t_p = unname(tt$p.value),
          t_ci_low = unname(tt$conf.int[1]),
          t_ci_high = unname(tt$conf.int[2]),
          ks_D = unname(ks$statistic),
          ks_p = unname(ks$p.value),
          stringsAsFactors = FALSE
        )
      }
    }
  }

  out <- do.call(rbind, results)
  if (is.null(out)) out <- data.frame()
  out
}

df <- read.table("data.txt", header = TRUE, quote = "\"")
vars   <- c("CHOL", "BMI", "HDL", "LDL")
groups <- c("SEX", "SMOKE", "T2D")

res <- run_tests(df, vars, groups, min_n_per_group = 30)

if (nrow(res) > 0) {
  alpha <- 0.05
  res$t_sig  <- res$t_p  < alpha
  res$ks_sig <- res$ks_p < alpha
  res$agree  <- res$t_sig == res$ks_sig
}

res <- res[order(res$agree, res$t_p), ]
print(res, row.names = FALSE)