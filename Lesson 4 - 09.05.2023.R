rm(list = ls())

library(wooldridge)
library(corrplot)

# structure of the dataset ----

View(wage1)
nrow(wage1)
ncol(wage1)
dim(wage1)
str(wage1)
colnames(wage1)

# indexing ----

wage1$wage[5]
wage1$wage[c(5,6,7)]
wage1$wage[c(5:7)]
wage1$wage[5] <- 10
wage1$educ[-c(5:nrow(wage1))]
wage1[,-1]

wage1[, colnames(wage1) %in% c("wage", "educ", "exper")]

wage1$wage_EUR <- wage1$wage * 0.86

wage1[, c("wage", "educ", "exper")]

wage1[1:5, c("wage", "wage_EUR")]

# condition slection ----

wage1_15plus <- wage1[wage1$educ > 15,]

wage1$educ[wage1$educ > 15 & wage1$educ < 18]

length(wage1$educ[wage1$educ > 15 & wage1$educ < 18])

# NR people more 15 / Nr people total * 100 ----

sum(wage1$educ > 15) / nrow(wage1) * 100

data_w <- wage1[, c("wage", "educ", "exper", "tenure")]

data_w_corr <- cor(data_w)

corrplot(data_w_corr)

corrplot(data_w_corr,
         method = "number",
         type = "upper")


