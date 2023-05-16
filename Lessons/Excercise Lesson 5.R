x <- c(68, 84, 75, 82, 68, 90, 62, 88, 76, 93,
       73, 79, 88, 73, 60, 93, 71, 59, 85, 75,
       61, 65, 75, 87, 74, 62, 95, 78, 63, 72,
       66, 78, 82, 75, 94, 77, 69, 74, 68, 60,
       96, 78, 89, 61, 75, 95, 60, 79, 83, 71,
       79, 62, 67, 97, 78, 85, 76, 65, 71, 75,
       65, 80, 73, 57, 88, 78, 62, 76, 53, 74,
       86, 67, 73, 81, 72, 63, 76, 75, 85, 77)

# 1
max(x)
# 2
min(x)
# 3
range <- max(x)-min(x)
range
# 4
x_sorted <- sort(x)
length(x_sorted)
x_sorted[(length(x_sorted)-4):length(x_sorted)]
# 5
x_sorted[1:5]

# or

x_sorted_des <- sort(x, decreasing = TRUE)
x_sorted_des[(length(x_sorted_des)-4):length(x_sorted_des)]

# 6
x_sorted_des[10]

# 7
morethan75 <- x_sorted>=75
sum(morethan75)

# 8
sum(x < 85)

# 9
(sum(x > 65 & x < 85) / length(x))*100
