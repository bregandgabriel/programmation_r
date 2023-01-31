brutToNet1 <- function(brut){ 
  if (is.numeric(brut)) { 
    return(brut-brut*0.22) 
  } else {
    return("ERROR : type not expected")  
  }}


brutToNet2<- function(brut,statu){ 
  if (is.numeric(brut)) { 
    if (statu == "cadre") { 
      return(brut-brut*(0.25+0.075))
    } else { 
      if (statu == "non-cadre"){ 
        return(brut-brut*(0.22+0.075))
      } 
      else {
        return("ERROR : contract unknown")
      }
    }
  } 
  else 
  {
    return("ERROR : type not expected")
  }
}



brutToNet3<- function(brut,statu,temp=100,taux=7.5){
  if (is.numeric(brut) & is.numeric(taux) & is.numeric(temp)){
    if (temp>=0 & temp<=100 ){
      if(taux>=0&taux<=100){
        if (statu == "cadre") {
          return(brut*temp/100-brut*(0.25+taux/100)*temp/100)
        } else {
          if (statu == "non-cadre")
          {
            return(brut*temp/100-brut*(0.22+taux/100)*temp/100)
          } else {
            return("ERROR : contract unknown")
          }
        }
      }
      else{return("ERROR : : rate and taux must be in range(0,100)")}
    }
    else{return("ERROR : : rate and time must be in range(0,100)")}
  }  
  else{
    return("ERROR : type not expected")
  }
}

#netAnnuelToImpot<-function(salaire){
#  if (salaire>10777){
#    if (salaire>27478){
#      if (salaire>78570){
#        if (salaire>168994){
#          return(77244.26 + (salaire - 168994) * 0.45)
#        }
#        else{return(21969.8 + (salaire - 78570) * 0.41)}
#      }
#      else {return(3025.56 + (salaire - 27478) * 0.3)}
#    }
#    else {return((salaire - 10777) * 0.11)}
#  }
#  else{return(0)}
#}

netAnnuelToImpot<-function(salaire){
  if (salaire<10777){return(0)}
  if (salaire<27478){return((salaire - 10777) * 0.11)}
  if (salaire<78570){return(1837.11 + (salaire - 27478) * 0.3)}
  if (salaire<168994){return(17164.71 + (salaire - 78570) * 0.41)}
return(54238.55 + (salaire - 168994) * 0.45)}

justePrix<-function(){
  user_choice = 0
  ai_choice <- sample(x = 1:100,size = 1)
  user_choice_dif<- readline(prompt = "facile ou difficile ")
  life = 10
  while(user_choice!=ai_choice){user_choice<- readline(prompt = "Saisissez une valeur textuelle : ")
  if (user_choice>ai_choice){
    print("plus petit")
  }
  else{
    if(user_choice!=ai_choice){print("plus grand")}else{print("gg")}
  }
  if (user_choice_dif=="difficile"){
    life = life-1
    print("vie")
    print(life)
    if(life==0){
      print(ai_choice)
      return("perdue"  )
    }
  }
  }
}

pierreFeuilleCiseaux<-function(){
  ai_choice <- sample(x = c("pierre","feuille","ciseaux"),size = 1)
  user_choice<- readline(prompt = "pierre , feuille ou ciseaux: ")
  print(ai_choice)
  if(user_choice == ai_choice){return("égalité")} else if(user_choice == "pierre"){
    if(ai_choice == "ciseaux"){return("gagné")}
    else {return("perdue")}} else if(user_choice == "feuille"){
      if(ai_choice == "pierre"){return("gagné")}
      else {return("perdue")}}
  else {if(ai_choice == "feuille"){return("gagné")} else
  {return("perdu")}}
  return("bug")}