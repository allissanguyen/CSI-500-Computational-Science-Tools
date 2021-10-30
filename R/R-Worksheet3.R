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


########## Problem #3: Data Analysis #########
# In the lectures, we discussed the picnic problem.  
# Recall that our analysis started from the assumption that day 1 was sunny rather than rainy.  
# What would have happened if we started our analysis assuming that the day 1 was rainy instead?  
# You may wish to run the model discussed in class using a different starting condition vector and see what happens.
# What is the effect of starting from a rainy day instead of a sunny day?
# What did you find?
# 
# In the lectures, we discussed using a 3-compartment model as a matrix-based analysis of the Diffusion of Innovation.
# Try running the model with different values of beta and gamma, and see if you can get a diffusion bubble that looks like the real iPad sales data.
# Recall that the real data is collected over 24 time periods of business quarters, so your time value should range from 1 to 24.
# What values of beta and gamma work best?


# define printf()
printf = function(s, ...)
  cat(paste0(sprintf(s, ...)), '\n')

# define matrix power function
mpow = function(m, p) {
  val = m
  for (i in 1:(p-1)) {
    val = m %*% val
  }
  return(val)
}

p_sun_sun = 0.80
p_sun_rain = 0.20
p_rain_sun = 0.90
p_rain_rain = 0.10
M = matrix(
  nrow = 2, ncol = 2,
  byrow = TRUE,
  data = c( p_sun_sun, p_sun_rain,
            p_rain_sun, p_rain_rain)
)
P0 = c(0, 2)

tmax = 20
trange = seq(from = 1, to = tmax, by = 1)
printf("%8s %8s %8s", "time", "p(sun)", "p(rain)")
for (i in trange) {
  Mt = P0 %*% mpow(M, i)
  printf("%8d %8.4f %8.4f", i, Mt[1], Mt[2])
}
# 
# Starting on a rainy day instead of sun changes the probability. 
# For p(sun), the value converges to 1.6364 and p(rain) coverges to .3636.


# define transition matrix for 3 class population
# beta is transition rate from potential to adopter
# gamma is transition rate from adopter to disposer

beta = 0.1
gamma = 0.05
M = matrix(
  nrow = 3,
  ncol = 3,
  byrow = TRUE,
  data = c(-1 * beta, 0, 0,
           beta, -1 * gamma, 0,
           0, gamma, 0)
)

# initial population sizes
num.potential = 99
num.adopters = 1
num.disposers = 0
# N is initial pop vector distribution
N = c(num.potential, num.adopters, num.disposers)
# print title and column headers
printf("population over time")
printf("%4s%5s%8s%5s%8s%5s%8s",
       "time", " ",
       "potential", " ",
       "adopters", " ",
       "disposers" )
printf("%4d %8.2f %8.2f %8.2f",
       0, N[1], N[2], N[3])

# keep track of pop history over time
pop.hist.potentials = c(num.potential)
pop.hist.adopters = c(num.adopters)
pop.hist.disposers = c(num.disposers)
# set up time range
tmax = 24
trange = seq(from = 1, to = tmax, by = 1)

# iterate and compute pop changes over time
for (i in trange) {
  Nt = M %*% N
  N = N + Nt
  # print current pop distribution
  printf("%4d %8.2f %8.2f %8.2f",
         i, N[1],N[2],N[3])
  # keep track of history for plotting later
  pop.hist.potentials = c(pop.hist.potentials, N[1])
  pop.hist.adopters = c(pop.hist.adopters, N[2])
  pop.hist.disposers = c(pop.hist.disposers, N[3])
}

# make the plot
plot(
  trange,
  pop.hist.potentials[1:tmax + 1],
  ty = "l",
  lwd = 2,
  col = "blue",
  ylim = c(0, max(pop.hist.potentials,
                  pop.hist.adopters,
                  pop.hist.disposers)),
  main = "Diffusion of Innovation Model",
  xlab = "time",
  ylab = "pop size"
)

lines(trange,
      pop.hist.adopters[1:tmax + 1],
      ty = "l",
      lwd = 2,
      col = "green")
lines(trange,
      pop.hist.disposers[1:tmax + 1],
      ty = "l",
      lwd = 2,
      col = "red")

legend(
  "right",
  legend = c("potential", "adopters", "disposers"),
  col = c("blue", "green", "red"),
  pt.cex = 1.0,
  cex = 0.75,
  lwd = c(rep(3, 1.0)),
  bty = 'y',
  inset = c(0.02, 0.02),
  y.intersp = 0.75
)
grid()