get()
horse_price=read.csv("HorsePrices .csv")
horse_price

###check for NA - missing values
any(is.na(horse_price))

horse_price=na.omit(horse_price)
dim(horse_price)
head(horse_price)

price=horse_price$Price
height=horse_price$Height
plot(height,price, col="purple")

horse_price_model1=lm(price~height)
##horse_price_model2= lm(Price~Height, data=horse_price)
abline(horse_price_model1, col="red",lwd=2)

###calculating the pvalue pt(x,df)=p(x<=x)
summary(horse_price_model1)
(1-pt(3.316,45))*2
###to get the summary of individual components
horse_price_model1$coefficients
resid=horse_price_model1$residuals
hist(resid)
qqnorm(resid)###if majority of the variable are on the line or close to the line, we say it is normal distribution
qqline(resid)


####to correct the small value of r, you increase the number of regressors
options(scipen = 100) ###changing all scientific notations to real
horse_price_model2=lm(Price~ Age+ Height+Sex, 
                      data = horse_price)
summary(horse_price_model2)

###
horse_price=read.csv("HorsePrices .csv")

###
coin=c("H","T")
countH=0
repeat{
  toss=sample(coin,1)
  cat("toss is", toss, "\n")
  if (toss=="H"){
    
    countH=countH+1
    cat("CountH is", countH, "\n")
  }
  if (countH==3){
    break
  }
}





