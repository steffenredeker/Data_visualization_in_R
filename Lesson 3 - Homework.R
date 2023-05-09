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
  
  consumption_share <- (consumption_germany/income_germany)*100
  
  plot(1991:2022,
       consumption_share,
       main = countries[i],
       xlab = "years",
       ylab = "%",
       ylim = c(50, 90),
       type = "l")
}

  
  