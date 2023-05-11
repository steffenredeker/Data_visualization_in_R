library(eusa)
data("awards")
colnames(awards)

germany_awards <- awards[awards$member_state == "Germany", ]

germany_awards$year_month <- format(as.Date(paste0(germany_awards$publication_year, "-", germany_awards$publication_month, "-01")), "%Y-%m")

sum_by_year_month <- aggregate(raw_amount ~ year_month, data = germany_awards, FUN = sum)

plot(sum_by_year_month$raw_amount, type = "p",
     xlab = "Year-Month", ylab = "Raw Amount", main = "Germany - State Aid", xaxt="n")

reg_model <- lm(raw_amount ~ year_month, data = germany_awards)

abline(reg_model, col = "blue")

median_by_year_month <- aggregate(raw_amount ~ year_month, data = germany_awards, FUN = median)
abline(h = median_by_year_month$raw_amount, col = "red", lty = 2)

axis(1, at = seq_along(sum_by_year_month$year_month)[c(1,13,25,37,49)], 
     labels = c("2016", "2017", "2018", "2019", "2020"), tick=TRUE, col.axis="black")

legend("topleft", legend = c("Raw Amount", "Regression Line", "Median Line"), col = c("black", "blue", "red"), lty = c(1, 1, 2), cex = 0.8)