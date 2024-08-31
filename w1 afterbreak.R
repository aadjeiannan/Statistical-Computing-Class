horse_price=read.csv("HorsePrices .csv")
horse_price

###check for NA - missing values
any(is.na(horse_price))
horse_price=na.omit(horse_price)
dim(horse_price)
head(horse_price)
names(horse_price)


######

train=sample(1:47, 38) ##80% of total data
train_data=horse_price[train,] #subsetting data
dim(train_data)
test_data=horse_price[-train]
dim(test_data)

####
head(train_data)
model1=lm(Price~Age+Height+Sex, data=train_data)
model1
yhat_model1=predict(model1, newdata=test_data)
# Check if 'Age' column exists in test_data
if(!'Age' %in% colnames(test_data)) {
  stop("Column 'Age' not found in test_data")
}

# Assuming 'Age' column is missing or named differently, correct it
# This is just an example. The specific correction will depend on your situation
# For instance, if the column is named 'age' instead of 'Age', you could rename it:
# test_data$Age <- test_data$age

# Then try the prediction again
yhat_model1 <- predict(model1, newdata=test_data)


MSE1=sum((test_data$Price-yhat_model1)^2)/length(yhat_model1)
MSE1

###GLMM

#pi/1-pi odds ration , log(pi/1-pi)=xb... E(y/x)= (1/1+e^-xb)
#

###logistic regression model.. command name =glm

?glm

beta0=2.5
beta1=-2
beta2=1.2
n=1000

x1=rnorm(n, 3, 1.3)
x2=runif(n,3, 6)

eta=beta0+beta1*x1+beta2*x2
prob=1/(1+exp(-eta))

y=rbinom(n, 1, prob=prob)
ones=rep(1,n)
my_simu_data=data.frame(y, x1, x2)
logisticmodel 1=






