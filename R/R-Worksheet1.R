# R Worksheet #1 
# Author: Allissa Nguyen


# Imagine you own a portfolio consisting of shares of the following high technology companies as shown in Table 1.  Recent closing prices for these shares of stock are shown in the 3rd column of the table.
# Table 1. Stock Portfolio
# Company	        Number of Shares	Closing Price ($)
# Hewlett-Packard	1000	            20.00
# IBM	            350	              150.00
# Google        	250	              1250.00
# Amazon        	500	              1600.00

# 1.1	Write an R expression to store the names of the companies as a character vector

# 1.2	Write an R expression to store the number of shares as a numeric vector

# 1.3	Write an R expression to store the closing price as a numeric vector

# 1.4	Write an R expression using your vectors and R vector arithmetic operator(s) to compute your total portfolio value (number of shares * closing price).  What is the market value of your portfolio?

# 1.1 store names of companies as character vector
companies <- c('Hewlett-Packard', 'IBM', 'Google', 'Amazon')
num_shares <- c(1000,350,250,500) # 1.2 store number of shares as numeric vector
closing_price <- c(20,50,1250,1600) # 1.3 store closing price as a numeric vector

total_port_val <- num_shares*closing_price # 1.4 compute total portfolio value
sum(total_port_val) 
# market value of portfolio: 1150000


# Assume you want to go on a vacation at the end of the semester, and you need to book travel and hotel fares now before travel rates go up.  You decide to sell 20 shares of IBM stock and 50 shares of Hewlett-Packard stock to finance your vacation.
