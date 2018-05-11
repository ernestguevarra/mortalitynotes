## kids found in each age-group in survey
kids <- c(172, 155, 144, 134, 125)
ages <- c (1, 2, 3, 4, 5)
model <- lm(log(kids) ~ ages)
model
tab <- as.table(kids)
names(tab) <- ages
bp <- barplot(tab, xlab = "Age (years)", ylab = "Number of children")
## mortality rate (deaths / 10,000 / day)
u5mr <- abs(coef(model)[2]) * 10000 / 365.25
names(u5mr) <- "u5mr"
u5mr
## expected numbers
expected.s0 <- exp(model$coefficients[2] * ages)
expected.p0 <- expected.s0 /  sum(expected.s0)
expected.n0 <- expected.p0 * sum(kids)
lines(bp[,1], expected.n0, lwd = 2, col = "red")
