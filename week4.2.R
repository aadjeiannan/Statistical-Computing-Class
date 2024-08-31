###rep
?rep

rep(2, 10)
rep("A", 20)
rep("male", 20)
gender=c(rep("male", 10), rep("female",15))
gender

##any
x=1:12
any(x>12)
any(x>=10)
all(x>10)

##which
which(x>10)

##
y=67
5%%2
4%%2

a= 11

if(a%%2==0){
  #print("This number is even")
  cat(a,"is an even number" )
}else{
    cat(a, "is an odd number")
}



#solution to quadratic equation

a=5
b=3
c=-8

disc=b^2-4*a*c

if(disc>0){
  root1=(-b+sqrt(disc))/(2*a)
  root2=(-b-sqrt(disc))/(2*a)
  cat("There are two roots","\n")
  cat("Roots are", root1,root2)
} else if(disc==0){
  root=b/(2*a)
  cat("There is only one root", "\n")
  cat("The root is", root)
} else{
  cat("There are no roots")
}
#####


gender= c(rep("m", 10), rep("f", 12))
gender
gender_dummy=ifelse(gender=="m", 1,0)
gender_dummy
df.data.frame(gender, gender_dummy)
df
view(df)


###
#x=c(2, 4, 6, 8)

#n=lenght(x)
U=vector()
n=5
for (i in 1:n) {
  U[i]=i*2
  cat("This is iter", i, "\n")
  cat("value is",)
}


###
n=5
U=vector()
for (i in 1:n){
  U[i]=i*2
}
###
r=c(2, 3, 4,5, 7)
A=vector()
for (i in 1:length(r)){
  A[i]= pi*r[i]^2
}
A



