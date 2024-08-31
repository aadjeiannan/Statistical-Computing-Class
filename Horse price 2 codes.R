
horse_price=read.csv("HorsePrices .csv")
horse_price

###check for NA - missing values
any(is.na(horse_price))
horse_price=na.omit(horse_price)
dim(horse_price)
head(horse_price)


####dummy

sex=horse_price$Sex
sex=ifelse(sex=="m", 0, 1)


price=horse_price$Price

plot(sex, price, col="red", pch=19)
model1=lm(price~sex)
abline(model1, lwd=2,col="purple")
model1$coefficients

##E(price|sex)=34548.28-17209.39sex

mean(horse_price$Price[horse_price$Sex=="m"])
mean(horse_price$Price[horse_price$Sex=="f"])

#average price 
17338.89 - 34548.28


###
model2=lm(Price~Sex, data=horse_price)
model2$coefficients

###
model3=lm(Price~Sex+Age+Height, data=horse_price)
model3$coefficients




anova(model3)
SSR=3289299702+255115083+783271384
SSR


###estimate model is:
###price_hat=-105448.375+ 9928.290*sex +-1036.675*age+ 8269.789*height

#What is the average price of a male with height 17 and age 7?

col=rep(c("red","green","black"), c(3,4,2))
col1=ifelse(col=="green",1,0)
col2=ifelse(col=="black", 1,0)
df=data.frame(col,col1, col2)
df

install.packages("e1071")
library("e1071")
