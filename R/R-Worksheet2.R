# R Worksheet #2
# Author: Allissa Nguyen

########## Problem #1: R Data frame Management #########
# Given the following data, create R data frames, and then provide R code to create a combined frame that merges these frames by joining on the common ID.
# id	major	        GPA
# 123	Data Science	3.8
# 245	Pre Med	      3.2
# 387	Public Health	3.4
# 
# id	dorm	in_state
# 123	N	    Y
# 245	Y	    Y
# 387	Y	    N
#
# 1.2	Frame selection: Provide well documented R code to represent the two data frames, and provide additional R code to select only the major and in_state fields from the combined data frame.

id <- c(123, 245, 387)
major <- c('Data Science', 'Pre-Med', 'Public Health')
GPA <- c(3.8, 3.2, 3.4)
dorm <- c('N', 'Y', 'Y')
in_state <- c('Y', 'Y', 'N')

df1 = data.frame(id, major, GPA) # creates dfs
df2 = data.frame(id, dorm, in_state)

df1_2 <-merge(df1, df2, by = 'id') # combines df1 and 2
df1_2[c('major', 'in_state')] # filters to select major and in_state



########## Problem #2: Functions #########
# Implemente the Fibonacci function.  
# Provide output for the values from 1 to 20.

# function for fibonacci sequence
fib = function(n){
  if( n==0 |  n==1){
    return (1)
  }
  else{
    n = fib(n-1) + fib(n-2)
  }
}

printf = function(s, ...){
  cat(paste0(sprintf(s, ...)), '\n')
}

for (i in 1:20){
  printf("fib = %d, i = %d\n", fib(i),i)}



########## Problem #3: Scientific Analysis and Visualization #########
# In the lectures, we discussed various ways of rendering multiple data sets for visualization. Use your R skills to analyze the following data and prepare a scientific graph.
# Import the Modern Applied Statistics with S+ (MASS) library into your R environment
library( MASS )
# From the MASS library, make a copy of the crabs data set
crab.data = MASS::crabs

# 3.1 Add a new computed column
# Add a new column named wl.ratio to the crab.data data frame that expresses the ratio of crab carapace length to crab body length.
# The carapace width is expressed in the CW column, and the body length is expressed in the CL column.
# 
# 3.2 Create subset data frames
# Create four new data frames, using the R data frame subsetting method of your choice, that divide the data up as follows.
# Provide R statements to extract the data into the new frames.
# species = B, 	sex = M
# species = B, 	sex = F
# species = O, 	sex = M
# species = O, 	sex = F
# 
# 3.3 Create a figure
# Create a single boxplot that displays the wl.ratio for each of the data frames you just created. 
# Include a main title, and include appropriate labels for each plot element using the names() command.

library(MASS) # import MASS library
crab.data = MASS::crabs # copied crabs data set

library(dplyr) # importing dplyr to easily add new column
crab.data.new <- crab.data %>%
  mutate(wl.ratio = CW / CL ) # add new column called wl.ratio

# creating subset data frames
crab.data.B.M <- crab.data.new %>% 
  filter(sp == 'B',
         sex == 'M')
head(crab.data.B.M)
# sp sex index   FL  RW   CL   CW  BD wl.ratio
# 1  B   M     1  8.1 6.7 16.1 19.0 7.0 1.180124
# 2  B   M     2  8.8 7.7 18.1 20.8 7.4 1.149171
# 3  B   M     3  9.2 7.8 19.0 22.4 7.7 1.178947

crab.data.B.F <- crab.data.new %>% 
  filter(sp == 'B',
         sex == 'F')
head(crab.data.B.F)
# sp sex index  FL  RW   CL   CW  BD wl.ratio
# 1  B   F     1 7.2 6.5 14.7 17.1 6.1 1.163265
# 2  B   F     2 9.0 8.5 19.3 22.7 7.7 1.176166
# 3  B   F     3 9.1 8.1 18.5 21.6 7.7 1.167568

crab.data.O.M <- crab.data.new %>% 
  filter(sp == 'O',
         sex == 'M')
head(crab.data.O.M)
# sp sex index   FL  RW   CL   CW   BD wl.ratio
# 1  O   M     1  9.1 6.9 16.7 18.6  7.4 1.113772
# 2  O   M     2 10.2 8.2 20.2 22.2  9.0 1.099010
# 3  O   M     3 10.7 8.6 20.7 22.7  9.2 1.096618

crab.data.O.F <- crab.data.new %>% 
  filter(sp == 'O',
         sex == 'F')
head(crab.data.O.F)
# sp sex index   FL   RW   CL   CW   BD wl.ratio
# 1  O   F     1 10.7  9.7 21.4 24.0  9.8 1.121495
# 2  O   F     2 11.4  9.2 21.7 24.1  9.7 1.110599
# 3  O   F     3 12.5 10.0 24.1 27.0 10.9 1.120332

boxplot(crab.data.B.F$wl.ratio,crab.data.B.M$wl.ratio, crab.data.O.F$wl.ratio, crab.data.O.M$wl.ratio,
        names = c('BF', 'BM', 'OF', 'OM'),
        main = "Crab Width-Length",
        col = 'white')

