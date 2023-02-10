#####Exercice 1####
q1 <- read.csv(file="C:/Users/gbregand/Desktop/quiz1.csv",head=TRUE,sep=";",dec=".")
View(q1)
q2 <- read.csv(file="C:/Users/gbregand/Desktop/quiz2.csv",head=TRUE,sep=NULL,dec=",")
View(q2)
q3 <- read.csv(file="C:/Users/gbregand/Desktop/quiz3.csv",head=FALSE,sep="|",dec=".")
View(q3)
q4 <- read.csv(file="C:/Users/gbregand/Desktop/quiz4.csv",head=TRUE,sep=";",dec=",",row.names=1)
View(q4)


#####Exercice 2####


quiz_final<-data.frame()

colnames(q3) <- colnames(q4)

q1$quiz=(1)
q2$quiz=(2)
q3$quiz=(3)
q4$quiz=(4)


quiz_final<-rbind(q1,q2,q3,q4) 


#####Exercice 3####


mean(quiz_final$Total.Score..points.)

quantile(quiz_final$Average_time)

boxplot(quiz_final$Average_time)
        
        