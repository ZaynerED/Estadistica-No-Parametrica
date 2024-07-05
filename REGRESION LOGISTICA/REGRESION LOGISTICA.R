#limpiar datos
rm(list=ls())
#limpiar graficos
dev.off()
#limpiar consola
cat("\014")

# datos
datos<-read.csv("dat.csv",header=T)
datos

# Modelo de Regresión logistica 
mod1<-glm(mejora~dosis, data=datos, family=binomial(link="logit"),
          weights = frec)
summary(mod1)
# En sas el programa toma los 0 como exitos y los 1 como fracasos
# en R es al reves, por lo que se debe cambiar la variable respuesta
# para que coincida con el modelo
predict(mod1, type="response")
predict(mod1)
# este modelo por el "response, da las probabilidades de exito

# Modelo de regresion probit:

mod2<-glm(mejora~dosis, data=datos, family=binomial(link="probit"),
          weights = frec)
summary(mod2)

library(dplyr)
library(readr)
file<-read.table("cleveland.csv", sep=" ", header=T)

datos<-read.table(file, sep=";", header=T))