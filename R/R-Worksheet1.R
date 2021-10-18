# R Worksheet #1 
# Author: Allissa Nguyen

########## Problem 1 #########

# Imagine you own a portfolio consisting of shares of the following high technology companies as shown in Table 1.  
# Recent closing prices for these shares of stock are shown in the 3rd column of the table.
# Table 1. Stock Portfolio
# Company	        Number of Shares	Closing Price ($)
# Hewlett-Packard	1000	            20.00
# IBM	            350	              150.00
# Google        	250	              1250.00
# Amazon        	500	              1600.00

# 1.1	Write an R expression to store the names of the companies as a character vector
# 1.2	Write an R expression to store the number of shares as a numeric vector
# 1.3	Write an R expression to store the closing price as a numeric vector
# 1.4	Write an R expression using your vectors and R vector arithmetic operator(s) to compute your total portfolio value .  
# What is the market value of your portfolio?

companies <- c('Hewlett-Packard', 'IBM', 'Google', 'Amazon') # stores names of companies as character vector
num_shares <- c(1000,350,250,500) # stores number of shares as numeric vector
closing_price <- c(20,50,1250,1600) # stores closing price as a numeric vector

total_port_val <- num_shares*closing_price # compute total portfolio value
sum(total_port_val) # sum of elements
# market value of portfolio: 1,150,000



# Assume you want to go on a vacation at the end of the semester, and you need to book travel and hotel fares now before travel rates go up.  
# You decide to sell 20 shares of IBM stock and 50 shares of Hewlett-Packard stock to finance your vacation.
# 1.5 Write an R expression to indicate the change in number of shares 
# 1.6 How much is the current value of your portfolio after you make the sale?  
# 1.7 How much money do you now have for your vacation (ignore taxes and brokerage fees for this example).

to_sell <- c(50,20,0,0) # amount to sell
port_after_sell <- num_shares-to_sell # compute shares left after sale
total_port_val_after_sell <- port_after_sell * closing_price # computing current value
sum(total_port_val_after_sell) # sum of elements
# market value of portfolio after sale: 1,148,000

money_for_vacay <- to_sell*closing_price # computing shares sold value
sum(money_for_vacay) # sum of elements
# money for vacation: 2000

# Now assume that Congress passes the "High Technology Investment Act of 2020", which provides 
# tax benefits and incentives for high tech companies. 
# As a result of this new law, high tech companies are expected to see stock prices rise 6.25%.  
# 1.8 Write an R expression that will adjust the value of your stock portfolio as a result of this legislation
# 1.9 How much is the new value of your portfolio after the law takes effect and stock prices go up?

# utilizing value for after sales of stocks
new_value_from_legislation <- total_port_val_after_sell*1.625
sum(new_value_from_legislation)
# market value of portfolio after new law: 1,865,500



########## Problem 2 #########
# Imagine you are a market analyst, and you are assigned the task of forecasting sales price 
# and demand for a new type of athletic wristwatch called the ZipFit.  
# Based on analysis of similar products in this market space, you estimate that for production of 
# about 4.5 million units, the market price could be about $150, 
# but ZipFits could sell for less if there were higher levels of production.  
# Use the graph in Figure 1 as a guide for this problem.

# Demand Curve Analysis
# 2.1 What is the slope (m) of the demand curve (the blue line)? Recall that slope is defined as dy/dx, or (y2-y1)/(x2-x1).
# 2.2 What is the Y-intercept (b) of the demand curve (the blue line)
# 2.3 Using the values you just found, what is an expression for the line expressing the demand curve, using Y = mx + b format?

# Supply Curve Analysis
# 2.4 What is the slope (m) of the supply curve (the red line)?  Recall that slope is defined as dy/dx, or (y2-y1)/(x2-x1).
# 2.5 What is the Y-intercept (b) of the supply curve (the red line)?
# 2.6 Using the values you just found, what is an expression for the demand curve using Y = mx + b notation?

# 2.7 Using R matrix function "solve()" to compute the inverse of the matrix A.  What is your computed inverse matrix A-1 ?
# Using your computed inverse matrix A-1, now solve the matrix expression below to compute the optimal quantity and price values for x and y.
# Recall that any matrix A multiplied by its inverse A-1 results in the identity matrix I.  
# Compute the optimal values for x and y.
# 2.8 What is the R expression using matrix operations to compute A-1*b ?
# 2.9 What is the optimal value x for the quantity of ZipFits to be produced (q*) in this market system?
# 2.10 What is the optimal value y for the price of ZipFits to be consumed (p*) in this market system?

m_demand = (0-400)/(7-0) # slope of demand
b_demand = 400 # y-int
# expression y = -57.143x + 400

m_supply = (100-0)/(3-0) # slope of supply
b_supply = 0
# expression y = 33.333x + 0

matrix_a = matrix(nrow = 2, ncol = 2, byrow = TRUE, data = c(-m_demand, 1, -m_supply, 1))
matrix_b = matrix(nrow = 2, ncol = 1, data = c(b_demand, b_supply))

inverse_matrix_a = solve(matrix_a) # compute inverse A
#            [,1]        [,2]
# [1,] 0.01105263 -0.01105263
# [2,] 0.36842105  0.63157895

solve(matrix_a, matrix_b) # compute inverse of A multiplied by b
#            [,1]
# [1,]   4.421053
# [2,] 147.368421
# (4.421, 147.368) (x,y) coordinates



########## Problem 3 #########
# •	Create a sample data set called data_one using rnorm( 100, mean=0.0, sd=1.0)
# •	Create a sample data set called data_two using rnorm( 100, mean=0.8, sd=2.5)
# •	Create a stem-and-leaf plot for data_one
# •	Create a histogram for data_two
# •	Create a scatter plot for data_one
# •	Create a 2-D line plot showing the sorted values for data_two
# •	Create a double boxplot for data_one and data_two.  
# Use this command syntax: boxplot( data_one, data_two)

data_one <- rnorm( 100, mean=0.0, sd=1.0)
data_two <- rnorm( 100, mean=0.8, sd=2.5)

stem(data_one) # creates stem-and-leaf plot
# The decimal point is at the |
# 
# -3 | 0
# -2 | 
# -1 | 8777654422110
# -0 | 999887776444433322222111100
#  0 | 011111122222333334555555556667779999
#  1 | 01112334456777789
#  2 | 011234





boxplot( data_one, data_two) # creates a double boxplot

