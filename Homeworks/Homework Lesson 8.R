rm(list = ls())

library(gapminder)
library(ggplot2)
library(dplyr)
print(gapminder)


# Maximum - grouped by year
maximum <- gapminder |>
  group_by(year) |>
  summarize(gapminder = max(lifeExp))

# Median - grouped by year
median <- gapminder |>
  group_by(year) |>
  summarize(gapminder = median(lifeExp))

# Minimum - grouped by year
minimum <- gapminder |>
  group_by(year) |>
  summarize(gapminder = min(lifeExp))

# China
china_data <- subset(gapminder, country == "China")
life_expectancy_column <- "lifeExp"
china_life_expectancy_by_year <- china_data[c("year", life_expectancy_column)]
print(china_life_expectancy_by_year)
  
# plot1 - colors but no legend
                                 
ggplot() +
  geom_line(data = maximum, aes(x = year, y = gapminder), color = "blue", linetype = "dashed") +
  geom_line(data = median, aes(x = year, y = gapminder), color = "orange", linetype = "dotted") +
  geom_line(data = minimum, aes(x = year, y = gapminder), color = "red") +
  geom_line(data = china_life_expectancy_by_year, aes(x = year, y = lifeExp), color = "black", linetype = "solid") +
  labs(x = " ", y = "Life expectancy at birth", color = " ") +
  scale_color_manual(values = c("blue", "orange", "red", "black"),
                     labels = c("Maximum","Median", "Minimum", "China")) +
  theme_minimal() +
  theme(panel.border = element_rect(color = "black", fill = NA)) +
  theme(legend.position = "bottom")

# plot2 - legend but wrong colors

ggplot() +
  geom_line(data = maximum, aes(x = year, y = gapminder, color = "blue"), linetype = "dashed") +
  geom_line(data = median, aes(x = year, y = gapminder, color = "orange"), linetype = "dotted") +
  geom_line(data = minimum, aes(x = year, y = gapminder, color = "red")) +
  geom_line(data = china_life_expectancy_by_year, aes(x = year, y = lifeExp, color = "black"), linetype = "solid") +
  labs(x = " ", y = "Life expectancy at birth", color = " ") +
  scale_color_manual(values = c("blue", "orange", "red", "black"),
                     labels = c("Maximum", "Median", "Minimum", "China")) +
  theme_minimal() +
  theme(panel.border = element_rect(color = "black", fill = NA)) +
  theme(legend.position = "bottom")
                                 