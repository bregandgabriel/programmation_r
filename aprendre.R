x <- 2 # on atribu a x la valeur 2
x + 4 # on peut faire des calcule a partir de la valeur x save
y <- 5 # on atribu a y la valeur 5
resultat <- x + y # on peut atribué a resultat un calcule
resultat
x <- 5 # si on execute la premier valeur de x vas etre ecrasé
x <- y # x peut prendre la valuer de y
y <- 3 #♥ la valeur de x n'est pas impacté par la modif 
chien <- "Chihuahua" # on peut affecter du texte 

##############################################

# on prend 5 personne et il veule connaitre le taille 
taille1 <- 156
taille2 <- 164
taille3 <- 197
taille4 <- 147
taille5 <- 173
tailles <- (taille1 + taille2 + taille3 + taille4 + taille5) / 5 # on peut ecrir comme ca

tailles <- c(156, 164, 197, 147, 173) # pour ne pas crée 2000 varible on peut faire des combinaison a la maniere d'une liste

tailles^2 # si on fait une affectation ca le fait sur tous

poids <- c(45, 59, 110, 44, 88)

imc <- poids / (tailles / 100) ^ 2 # on peut faire des calcule quand ca fait la meme taille

diplome <- c("CAP", "Bac", "Bac+2", "CAP", "Bac+3") # on peut faire des combinaison de texte

diplome[2] # renvoi "Bac" car c'est le 2eme élement ca commence pas a 0 mais a 1

diplome[c(2,3,4)] # donne une liste avec la valeur 2, 3 et 4

diplome[-2] # retire la 2eme valeur

#############################################