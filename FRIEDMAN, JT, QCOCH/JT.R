#limpiar consola
cat("\014")
#limpiar variables
rm(list=ls())
#limpiar plots
dev.off()
ferti<-read.csv("fert.csv", header = T)
ferti
ferti$dosis<-as.factor(ferti$dosis)
str(ferti)

#Cargar librerias
library(PMCMRplus)
library(PMCMR)
names(ferti)
#Prueba de Jonckheere-Terpstra
jonckheereTest(ferti$rend, ferti$dosis, alternative = "greater")
