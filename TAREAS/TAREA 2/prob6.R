#limpiar consola
cat("\014")
#limpiar variables
rm(list=ls())
#limpiar plots
dev.off()
library(ggplot2)
#Datos
dat<-read.csv("prob6.csv", header=T)
View(dat)
Frequencia<-dat$freq
Volumen<-dat$volume
attach(dat)
str(dat)
cor(Volumen,Frequencia)
plot(Volumen,Frequencia)
###
cor.test(Volumen,Frequencia, method = "spearman")
# El coeficiente de -0.76330357 indica que hay una correlación
# negativa entre el volumen y la frecuencia de los datos.

cor.test(Volumen, Frequencia, method ="kendall")
# El coeficiente de -0.6163968 indica que hay una correlación
# negativa entre el volumen y la frecuencia de los datos.