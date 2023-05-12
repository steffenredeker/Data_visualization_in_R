# Introduction ----
library(eusa)
library(scales)
data("awards")
colnames(awards)

# Main plot part ----

germany_awards <- awards[awards$member_state == "Germany", ]

germany_awards$year_month <- format(as.Date(paste0(germany_awards$publication_year, "-", germany_awards$publication_month, "-01")), "%Y-%m")

sum_by_year_month <- aggregate(raw_amount ~ year_month, data = germany_awards, FUN = sum)

sum_by_year_month$time_trend <- 1:nrow(sum_by_year_month)

plot(sum_by_year_month$raw_amount, type = "l",
     xlab = "Year-Month", ylab = "Raw Amount", main = "Germany - State Aid", xaxt="n", yaxt="n")

# Regression line ----
reg_model <- lm(raw_amount ~ time_trend, data = sum_by_year_month)
abline(reg_model, col = "blue")

# Median line ----
#median_by_year_month <- aggregate(raw_amount ~ year_month, data = germany_awards, FUN = median)
abline(h = median(sum_by_year_month$raw_amount), col = "red", lty = 2)

# Axis & Legend ----
axis(1, at = seq_along(sum_by_year_month$year_month)[c(1,13,25,37,49)], 
     labels = c("2016", "2017", "2018", "2019", "2020"), tick=TRUE, col.axis="black")

axis(2, at = c(1e9, 2e9, 3e9, 4e9, 5e9), 
     labels = c("1 bn.", "2 bn.", "3 bn.", "4 bn.", "5 bn."), tick=TRUE, col.axis="black")

legend("topright", 
       legend = c("Raw Amount", "Regression Line", "Median Line"), 
       col = c("black", "blue", "red"), 
       lty = c(1, 1, 2), 
       cex = 0.8,
       bty = "n")

# Problem ----
# Median and regression line seem to refer to the whole data set, but not to the modified plot with monthly sum values.
# However, when I change the data to "sum_by_year_month" it's not working either.
