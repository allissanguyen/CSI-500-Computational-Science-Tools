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


########## Problem #2: Using 3D Graphics #########
# 2.1 Create an X axis vector with integers from 1:10
# 2.2 Create a Y axis vector with integers from 1:10
# 2.3 Create a Z axis set of 100 random normally distributed data with mean = 0 and sd = 1.  
# Remember you will need to convert the Z values into a 10x10 matrix.
# 2.4 Use the contour() method to generate a plot.
# 2.5 Now use the same data and prepare a 3D plot using persp(). Adjust the theta and phi values to make the plot easier to read. 
# Include appropriate x, y, and z labels.

# x & y axis vector 1:10


x = c(1:10)
y = c(1:10)
xlen = length(x)
ylen = length(y)

z = rnorm(100)
z <- matrix(z, nrow = 10)

contour(x,y,z)
persp(x,y,z,
      theta = 30,
      phi = 30)

