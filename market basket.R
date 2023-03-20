install.packages("Groceries")
view(Groceries)
d=read.csv('C://Users//ASUS//Documents//New folder//archive//Groceries_dataset.csv')
d
d1=d[,-2]
d1
library(arules)
library(arulesViz)
data()
data(package = .packages(all.available = TRUE))
rm(list=ls())
data("Groceries")
str(Groceries)
inspect(Groceries)
gr_rules=apriori(Groceries,parameter = list(support=0.001,conf=0.8))
inspect(gr_rules[1:10])
gr_rules=sort(gr_rules,by='support',decreasing=T)
inspect(gr_rules[1:10])
gr_rules
redundant_rules=is.redundant(gr_rules)
redundant_rules
summary(redundant_rules)
gr_rules=gr_rules[!redundant_rules]
inspect(gr_rules[1:5])
plot(gr_rules,method='graph')
gr_rules=sort(gr_rules,by='support',decreasing=T,lhs)
plot(gr_rules,method='graph',interactive = T)
