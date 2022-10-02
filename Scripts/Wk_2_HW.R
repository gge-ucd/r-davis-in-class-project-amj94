set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)


hw2
hw2 <- na.omit(hw2)
hw2

#this is the function I used to get rid of the NAs in hw2

hw2

hw2[(hw2>13.99&hw2<38.01)]

#this should filter for numbers greater than 14 and less than 38 but it isn't working properly, needed to change | to &

prob1 = hw2[(hw2>13.99&hw2<38.01)]

prob1

prob1*3=times3

times3 = prob1*3

plus10 = times3+10

final <- plus10[c(TRUE,FALSE)]

final
