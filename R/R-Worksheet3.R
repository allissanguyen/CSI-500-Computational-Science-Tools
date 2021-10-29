# R Worksheet #3
# Author: Allissa Nguyen

library(tidyverse) 

########## Problem #1: R functions #########
# 1.1 Write an R function to compute this expression.  
# Test your function for integer values 0 < x < 100.
# 1.2 Write R code to plot the results of your test.
# 1.3 Write R code to create an input vector of integers from 1 to 100.  
# 1.4 Write R code to apply the dampening function you just wrote to the input vector using the sapply() function.

expression = function(x){return(sin(x)/x)} # R function to compute expression 

for (x in 1:100){        # testing for values 0 < x < 100
  print(expression(x))
}

# plotting
df = NULL
for (x in 1:100){
  x = x
  y = expression(x)
  df = rbind(df, data.frame(x,y))
}

# creating plot with ggplot
ggplot(df) +
  geom_line(aes(x=x,y=y)) +
  labs(title = "Plot of Sin(x)/x",
       y = "sin(x)/x")

plot(sapply(1:100, expression), type = 'l') # simple plot

#creating vectors of ints 1:100 
vector = seq(1,100, by=1) # creates numbers
vector2 = c(1:100) # creates intergers

# multiple ways of utilizing sapply with vectors of ints 
sapply(1:100, expression)
sapply(vector, expression)
sapply(vector2, expression)
