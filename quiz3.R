#1
library(datasets)
data(iris)
a<-iris[Species=="virginica",]
lapply(a,mean)


#2
b<-apply(iris[,1:4],2,mean)

#3
data(mtcars)
tapply(mtcars$mpg,mtcars$cyl,mean)

#4
c<-tapply(mtcars$hp,mtcars$cyl,mean)

