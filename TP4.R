# 1.1

set.seed(27)
c<-rnorm(n=10000000,mean=171,sd=9)

# 1.2

mean(tirage)#171.0002 trés proche de la moyenne
sd(tirage)#9.000623 trés proche de l'écart type
# oui nous retrouvons les valeur attendue

# 1.3

hist(tirage)

# 1.4

1-pnorm(q=190,mean=171,sd=9)#théorique
length(tirage[tirage>190])/10000000#nb de personne avec un taille superieur a 190 est 173916

#les valeur sont proche

# 1.5

pnorm(q=144,mean=171,sd=9)#théorique
length(tirage[tirage<144])/10000000#nb de personne avec un taille inferieur a 144 est 13407

#les valeur sont proche


# 2.1

set.seed(667)
echantillon<-sample(tirage,100)
mean(echantillon)#la moyenne est moins proche du résultat attendue
sd(echantillon)#l'a moyenne'écart type est moins proche du résultat attendue

# 2.2

x<-qnorm(p=1-(0.05/2),mean=0,sd=1)
interval<-x*(9/(100**0.5))
mine<-mean(echantillon)-interval
maxe<-mean(echantillon)+interval

# 2.3

remplisage<-as.data.frame(NULL)
set.seed(666)
base<-replicate(1000,remplisage<-sample(tirage,100))
View(base)

moyenne_G<-apply(base,2,mean)

ecart_G<-apply(base,2,sd)

# 2.4

hist(moyenne_G)

# 2.5

mean(moyenne_G)
sd(moyenne_G)

# 2.6

length(moyenne_G[moyenne_G>172.8])

(1-pnorm(q=172.8,mean=171,sd=9))*100
