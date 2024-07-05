tabla_corazon<- matrix(c(51,41,992,245), nrow = 2,ncol=2)
rownames(tabla_corazon)<- c("<260",">260")
colnames(tabla_corazon)<- c("Presente","Ausente")
tabla_corazon
# Chi 2 
chisq.test(tabla_corazon, correct = FALSE)
# Cramer
library(rcompanion)
cramerV(tabla_corazon)
# Se rechaza la hipótesis nula de 
# independencia entre la variable de interés y la variable de exposición.
# La fuerza de asociación es moderada.

library(rstatix)
# Proporciones de la variable de interés según la variable de exposición
prop_test(tabla_corazon, correct = FALSE, conf.level = 0.95, 
          alternative = "two.sided")
# Se rechaza la hipótesis nula de
# independencia entre la variable de interés y la variable de exposición.
