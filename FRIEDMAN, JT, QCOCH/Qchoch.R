#limpiar consola
cat("\014")
#limpiar variables
rm(list=ls())
#limpiar plots
dev.off()
#Q cho
horm<-read.csv("hormi.csv",header = T)
#librerias
install.packages("RVAideMemoire")
library(RBVA)