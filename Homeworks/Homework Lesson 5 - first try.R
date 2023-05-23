rm(list = ls())
library(readxl)

data <- read_excel("C:/Users/redek/Documents/Data_visualization_in_R/Homeworks/data_real_gdp.xlsx", sheet = 2, skip = 3)

Germany <- data[data$country == "Germany", ]
Spain <- data[data$country == "Spain", ]
France <- data[data$country == "France", ]
Greece <- data[data$country == "Greece", ]
Italy <- data[data$country == "Italy", ]
Netherlands <- data[data$country == "Netherlands", ]

all_countries <- list(Germany, Spain, France, Greece, Italy, Netherlands)
countries <- unique(data$country)
cols <- c("blue", "red", "green", "orange", "black", "purple")
y_min <- min(sapply(all_countries, function(country) min(as.numeric(country$value))))
y_max <- max(sapply(all_countries, function(country) max(as.numeric(country$value))))

quadratic_models <- lapply(all_countries, function(country) {
  country$year <- as.numeric(country$year)
  country$value <- as.numeric(country$value)
  lm(value ~ poly(year, 2, raw = TRUE), data = country)
})

x <- seq(1960, 2022, length.out = 100)
par(mfrow = c(2, 3))

for (i in 1:length(all_countries)) {
  plot(NULL, xlim = c(1960, 2022), ylim = c(y_min, y_max), xlab = "Year", ylab = "In GDP")
  lines(all_countries[[i]]$year, all_countries[[i]]$value, col = cols[i])
  y_pred <- predict(quadratic_models[[i]], newdata = data.frame(year = x))
  lines(x, y_pred, col = cols[i], lty = 2)
  
  # calculating with yi=β1+β2x2,i+β3x3,i+εi (seems not to work)
  beta <- coef(quadratic_models[[i]])
  y_gdp <- beta[1] + beta[2] * x^2 + beta[3] * x^3
  lines(x, y_gdp, col = "black", lwd = 2)  # (seems not to work)
  
  title(main = countries[i]) 
}

