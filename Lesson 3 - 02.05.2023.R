rm(list = ls())

library(readxl)

data_mpc <- read_excel("C:/Users/redek/Desktop/R/Data visualization with R/lesson 3/data_mpc.xlsx", 
                       skip = 1)
View(data_mpc)

data_mpc$country

countries <- unique(data_mpc$country)

cols <- c("blue", "red", "orange", "black", "purple")

#grid of plots
par(mfrow = c(2, 3))

for (i in 1:length(countries)) {

income_germany <- data_mpc$income[data_mpc$country == countries [i]]

consumption_germany <- data_mpc$consumption[data_mpc$country == countries [i]]

plot(income_germany,
     consumption_germany,
     main = countries[i],
     xlab = "income",
     ylab = "consumption")

reg <- (lm(consumption_germany ~ income_germany))

abline(reg, col = cols[i])

legend("topleft",
       bty = "n",
       lty = 1,
       lwd = 1,
       cex = 0.8,
       legend = paste("MPC:", round(reg$coefficients[2], digits = 2)),
       col = cols[i])
}


