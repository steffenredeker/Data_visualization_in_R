rm(list = ls())
library(wooldridge)
View(wage1)


# married men ----
married_men <- wage1[wage1$married == 1 & wage1$female == 0, ]

married_men_wage <- married_men[, c("wage")]
mean_married_men_wage <- mean(married_men_wage)

# single men ----
single_men <- wage1[wage1$married == 0 & wage1$female == 0, ]

single_men_wage <- single_men[, c("wage")]
mean_single_men <- mean(single_men_wage)

# single women ----
single_women <- wage1[wage1$married == 0 & wage1$female == 1, ]

single_women_wage <- single_women[, c("wage")]
mean_single_women_wage <- mean(single_women_wage)

# married women ----
married_women <- wage1[wage1$married == 1 & wage1$female == 1, ]

married_women_wage <- married_women[, ("wage")]
mean_married_women_wage <- mean(married_women_wage)

# barplot ----

all_wages <- c(mean_married_men_wage, mean_single_men, mean_single_women_wage, mean_married_women_wage)
group <- c("Married Men", "Single Men", "Single Women", "Married Women")

barplot(all_wages, 
        main = "Mean hourly wage by gender and marital status", 
        ylim = c(0, 10),
        ylab = "Dollar per hour",
        names.arg = group,
        col = c("blue", "blue", "red", "red"))

axis(if (horiz) 2 else 1, at = at.l, labels = names.arg, lty = 1)


