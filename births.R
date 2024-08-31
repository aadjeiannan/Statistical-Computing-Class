
setwd("C:/Users/LENOVO/Desktop/Rclass")
# read the csv file
births14 <- read.csv("births14.csv")
###another way of doing it births=("14read.csv")
```
#### Part (a)
```{r}
## See the first 6 columns
head(births14)
```
#### Part (b)
```{r}

#head() prints first 6 rows

head(births14)
tail(births14)

###getting first twenty rows
births14[1:20,]
## getting first twenty rows and column
births14[1:20,2:3]


# See the variable type, talks about the structure of the data.
#Part (b)
str(births14)
```
#### Part (c)
```{r}
# See the number of rows and columns, talks about the dimension
dim(births14)
```
#### Part (d)
```{r}
# See the variable names in the data sat
names(births14)
```
#### Part (e)
```{r}
# Find if there are empty cells, to check any missing values, True means there are missing data aand False means otherwise
any(is.na(births14))

#if you want to remove any of the omitted variables once, you can decide to assign new name so that you dont forget the data. its optional
births14_cleaned=na.omit(births14)

any(is.na(births14_cleaned))

#check dimension again
dim(births14)
dim(births14_cleaned)

```
#### Part (f)
```{r}
## Get the summary of the variable weight, lets start with babies
babies_weight=births14_cleaned$weight 
summary_weight=summary(babies_weight)
summary_weight
mean_weight=mean(babies_weight)
mean_weight

summary2=summary()

#summary(births14$weight)
```
#### Part (g)
```{r}
# Remove the NAs and get the summary
# checck if there NAs on variable weight
any(is.na(births14$weight))
# If there are NAs remove it
summary(births14$weight, na.rm = TRUE)
```
##Average weight of males? first extract
male.babies_weight=births14_cleaned$weight[births14_cleaned$sex=="male"]

male_babies_summary=summary(male.babies_weight)

mean_male.babies=mean(male.babies_weight)
