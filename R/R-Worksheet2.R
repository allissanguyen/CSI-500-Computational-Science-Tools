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

