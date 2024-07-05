#LIMPIAR CONSOLA
cat("\014")
#LIMPIAR GRAFICOS 
dev.off()
#LIMPIAR VARIABLES
rm(list=ls())

# PRACTICA 1
#DATOS
amoniaco<-read.csv("distbinom.csv",header = T)
#identificar tipos de variables en amoniaco
str(amoniaco)
boxplot(amoniaco)
hist(amoniaco$Amoniaco)
plot(density(amoniaco$Amoniaco))

#prueba del signo
binom.test(3,7,0.5,alternative = "greater")
#el primer numero es el mas pequeño, luego el total sin la coincidencias y el alfa#

View(amoniaco)
#prueba de wilcoxon (signo)

wilcox.test(amoniaco$Amoniaco,mu=1.5,alternative = "greater")

#prueba de t student (prueba parametrica)

t.test(amoniaco$Amoniaco,mu=1.5,alternative = "greater")
