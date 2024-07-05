#LIMPIAR CONSOLA
cat("\014")
#LIMPIAR GRAFICOS 
dev.off()
#LIMPIAR VARIABLES
rm(list=ls())

# PRACTICA 1
#DATOS
fotosin<-read.csv("PRAC2.csv",header = T)
sombra<-fotosin$Shady
sol<-fotosin$Sunny
#identificar tipos de variables en amoniaco
str(fotosin)
boxplot(fotosin)
View(fotosin)
#prueba de hipotesis
# Ho: la fotosintesis en sombra es mayor o igual que en sol
# H1: la fotosintesis en sombra es menor que en sol
# prueba de wilcoxon, el orden de las variables es el mismo que el de nuestra hipotesis
# en este caso primero es sol y luego sombra
wilcox.test(sol,sombra,paired = T, alpha = 0.05, alternative = "greater")
#prueba de t student
t.test(sol,sombra,paired = T, alpha=0.5, alternative = "greater")
#agregar columna de diferencia
diferencia<-data.frame(sol-sombra)
boxplot(diferencia)
