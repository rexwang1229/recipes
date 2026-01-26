#-------------------------------
# Chap3: Data transformation
#-------------------------------
install.packages("nycflights13")
library(nycflights13)
library(tidyverse)

## Important functions
# filter()
# arrange()
# select()
# mutate()
# summarize()

## filter(data_name, condition)
# logical operator: &, |(or), !, %in% (contain in a factor)
# missing value: (1) is.na(): 找是否有NA, (2) NA加減多少都是NA
# ex1
# a
filter(flights, arr_delay >= 120)
# b
filter(flights, dest %in% c("IAH", "HOU"))
# c
filter(flights, carrier %in% c("AA", "DL", "UA"))
# d 
filter(flights, month %in% c(7, 8, 9))
# e
filter(flights, arr_delay >= 120 & dep_delay <= 0)
# f
filter(flights, dep_delay >= 60 & dep_delay - arr_delay >= 30)
# g 
filter(flights, dep_time >= 0 & dep_time <= 600)
# ex2
# between(x, left, right) <=> x >= left & x <= right
# ex1g
filter(flights, between(dep_time, 0, 600))
# ex3
length(filter(flights, is.na(dep_time)))
# ex4
NA ^ 0
NA | TRUE
FALSE & NA
NA * 0

## arrange(data, desc(variable)); desc: descending order
# ex1
arrange(flights, desc(is.na(dep_time)))
# ex2
arrange(flights, desc(dep_delay))[1,]
# ex3
arrange(flights, distance / air_time)
# ex4
arrange(flights, distance)[1,]
arrange(flights, desc(distance))[1,]

## distinct():find all the unique rows in a dataset
# .keep_all: 在篩掉重複的部分後，仍保留其他沒有選取變數的其他資料
flights %>% distinct()
flights |> distinct(origin, dest)
flights |> distinct(origin, dest, .keep_all = TRUE)

## count(data, variable1, variable2,.., sort = TRUE)
# 找出在每個distinct的組合發生的次數
flights |> count(origin, dest, sort = T)










## select(data, variable1, variable2,...)


