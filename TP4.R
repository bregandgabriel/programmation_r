sample(1:100,2,replace=TRUE) #renvoie 2 valeur aléatoire entre 1 et 100 avec remise

set.seed(2023) #fixe une seed pour faire de la psedo aléatoire
sample(1:100,1)# vu que la seed est fixé cela va donner 80
set.seed(NULL)#supp la seed
sample(1:100,1)

x<-sample(x=c(1,2,3,4,5,6),size=100,replace=TRUE)#ca fait 100 tirage d'un des 6 
x

y<-sample(x=c("A","B","C","D","E","F"),size=1000000,replace=TRUE,prob=c(1/12,1/12,1/6,1/6,1/6,2/6))#1000000 tirage avec remise d'un des 6 avec ABCDEF ecrit dessus truqué avec plus de chance sur F
y
table(y)#permé de bien constaté la diff

z<-rbinom(100,size=10,prob=0.8)#probat uniforme de base
Fx<-ecdf(z)
plot(Fx,xlab="X"
     ,ylab="F(x)",ylim=c(0,1),
     mains="Fonction de répartition empirique")#renvoi le graph
freq_X<-prop.table(table(z))#donne la fréquence d'apparition
freq_X
plot(freq_X,xlab="k",ylab="freq(X=k)",main="répart")
mean(z)
pbinom(q=8,size=10,prob=0.8)#fonction de répartiton d'optenir des nombre entre 0 et 8 selon la loi binomial
cumsum(freq_X)#donne la répartition dans la simulation
qbinom(p=0.5,size=10,prob=0.8)#quantile a plus de 50% ( mediane )

a<-runif(1000,min=0,max=1000)
a

hist(a,main="Distrib",probability=T,ylim=c(0,0.15),ylab="Fréquence")#pourcentage
hist(a,main="Distrib",probability=F,ylab="Fréquence")#effectif

punif(q=8,min=0,max=10)
qunif(p=0.5,min=0,max=10)
dunif(0:10,min=0,max=10)

runif(1)#sort un nombre aléatoire ente 0 et 1 

b<-rnorm(n=100,mean=5,sd=2)#nombre de tirage = 100 ; moyenne = 5 ; ecart type = 2
b
hist(b,main="distribe loi normal",probability=T)
mean(b)
sd(b)

qnorm(0.975)
qnorm(0.95)
qnorm(0.995)

c<-replicate(1e5,mean(rnorm(n=100,mean=5,sd=2)))#moyenne echantion loi normal cela et fait 1000 fois
hist(c)
mean(c)
sd(c)



data("iris")
sapply(iris[,1:4],mean)#renvoie la moyenne de chaque colone 
sapply(iris[,1:4],function(x) max(x)/mean(x))# de meme mais avec une autre function 
toto<-function(x){max(x)/mean(x)}
sapply(iris[,1:4],toto)
# pour manipulé des matrisse

apply(iris[,1:4],1,mean)#trétement par ligne
apply(iris[,1:4],2,mean)#trétement par cologne

tapply(X=iris$Sepal.Length,INDEX=iris$Species,mean)