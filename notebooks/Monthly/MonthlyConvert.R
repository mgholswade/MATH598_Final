library(astsa)
library(xts)
library(tsbox)
library(MASS)

setwd('~/Documents/projects/MATH598_Final')

userData = read.csv('/home/mholswade/Documents/projects/MATH598_Final/data/steamUsers.csv')

times = as.Date(userData$DateTime,format='%Y-%m-%d')
xtsdata = xts(userData$Users,times)
tsdata = ts_ts(xtsdata)

data = window(xtsdata, start = "2010-1-4", end = "2020-3-8")

data = aggregate(data, as.yearmon(time(data)), mean, na.rm = TRUE, , na.action=NULL)
data = ts_ts(data)