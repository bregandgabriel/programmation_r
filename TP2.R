# install.packages("readxl")


#############2.1#############


#a

library(readxl) # importe la librérie utile au bon fonctionnement du programme suivant :

info_pok <- read_excel(path  = "C:/Programation R/TP2/pokemon.xlsx", sheet = "pokemon", range = "A1:J252") # récupere le dossier excel et le garde en mémoire

#b

dim_tab <- dim(info_pok) # donne le nombre de ligne puis de clogne 

print("nombre ligne");print(dim_tab[1]) # revoi le nombre de ligne

print("nombre cologne");print(dim_tab[2]) # revoi le nombre de cologne

#c

colnames(info_pok)#renvoi le nom des cologne 

#d

class(info_pok$generation)
class(info_pok$is_legendary)
class(info_pok$type)

#e

# as.factor vas transfomé en factor les ligne 

info_pok$generation<-as.factor(info_pok$generation)
info_pok$is_legendary<-as.factor(info_pok$is_legendary)
info_pok$type<-as.factor(info_pok$type)

View(info_pok) # j'ai voulu verifier que la transformation en factor n'affecter pas le jeu de donner 

#f

# avec levels() je renvoi tous les levels et length() les compte
print("nombre de différente géneration :") ; print(length(levels(info_pok$generation)))
print("nombre de possiblité entre etre légendaire ou non :") ; print(length(levels(info_pok$is_legendary)))
print("nombre de différente type de pokémone :") ; print(length(levels(info_pok$type)))

#g

View(info_pok) # ça affiche toute les donné et si on veut un résumé non exostif mais seulment avec les 6 dernier valeur on peut faire :
head(info_pok,6)


#############2.2#############


#a

mean(info_pok$weight_kg, na.rm=T) # moyenne des poid des pokémon en retirant si il y a des donner manquante

#b

median(info_pok$weight_kg, na.rm=T) # mediane des poid des pokémon en retirant si il y a des donner manquante

#c

quantile(info_pok$height_m, na.rm=T) # quantile des taille des pokémon en retirant si il y a des donner manquante

#d

quantile(info_pok$height_m,seq(0,1,0.1),na.rm=T) # déciles des taille des pokémon en retirant si il y a des donner manquante

#e

var(info_pok$weight_kg, na.rm=T) #var du poids

sd(info_pok$weight_kg, na.rm=T) #l'écart type corrigé du poids

#f

tri_plat <-function(factor=info_pok$generation){
  a = TRUE
  for (num_list in levels(factor)){
    count = 0
    for (pokemon_n in factor){
      if (num_list==pokemon_n){count<-count+1}
    } 
    if(a){liste_type<-c(num_list)
    liste_nb<-c(count)
    a = FALSE}
    else{liste_type<-c(liste_type,num_list)
    liste_nb<-c(liste_nb,count)}
  }
  liste_info<-data.frame(liste_type , liste_nb)
  rang <- order(-liste_info$liste_nb)
  liste_info <-liste_info[ rang , c("liste_type","liste_nb") ]
  return(liste_info)}

tri_plat(info_pok$generation)
tri_plat(info_pok$is_legendary)
tri_plat(info_pok$type)


#############2.3#############


#a

nom_lege<-info_pok[,c("nom","is_legendary")]
dim(nom_lege)

#b

fifty_first_nam_num<-head(info_pok[,1:2],50)
dim(fifty_first_nam_num)

#c

ten_first<-head(info_pok,10)
dim(ten_first)

#d

whithout_last <- head(info_pok[,1:ncol(info_pok)-1],nrow(info_pok))
dim(whithout_last)

#e

trie_alpha<-info_pok[order(info_pok$nom),]
top_alpha <- head(trie_alpha,1)
dim(top_alpha)


#f

trie_poid<-info_pok[order(-info_pok$weight_kg),]
top_poid<-head(trie_poid,1)
dim(top_poid)

#g

trie_attack_dec<-info_pok[order(-info_pok$attack),]
top_attack_dec<-head(trie_attack_dec,10)
trie_speed<-info_pok[order(info_pok$speed),]
top_speed<-head(trie_speed,10)
dim(top_attack_dec)
dim(top_speed)

#############2.4#############

#a

good_attaque<-info_pok[info_pok$attack>=150,c("nom","type")]
dim(good_attaque)

#b 

type_select <- info_pok[info_pok$type == "dragon" | info_pok$type == "ghost" | info_pok$type == "psychic" | info_pok$type == "dark", c("nom", "type")]
dim(type_select)

#c

fire_attaque<-info_pok[info_pok$type == "fire" & info_pok$attack>100,c("nom","type","attack")]
order_fire_attaque<-fire_attaque[order(-fire_attaque$attack),]
order_fire<-order_fire_attaque[,1:2]
dim(order_fire)

#d

speed_beetwen<-info_pok[info_pok$speed<150 & info_pok$speed>100,c("nom","type","speed")]
order_speed_beetwen_speed<-speed_beetwen[order(-speed_beetwen$speed),]
order_speed_beetwen<-order_speed_beetwen_speed[,1:2]
dim(order_speed_beetwen)

#e

na_poid <- info_pok[is.na(info_pok$height_m),c("nom","type") ]
dim(na_poid)

#f

info_good <- info_pok[complete.cases(info_pok[c("weight_kg", "height_m")]), ]
dim(info_good)

#g

lourd<-info_pok[info_pok$weight_kg>250,c("nom","type","attack")]
dim(lourd)