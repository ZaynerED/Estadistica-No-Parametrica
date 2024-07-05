#limpiar paneles
rm(list=ls())
#limpiar consola
cat("\014")
# Analisis factorial No parametrica #
#librerias
library(ARTool)
fert<- read.csv("fert.csv", header = T)
str(fert)
fert$trat<- as.factor(fert$trat)
fert$year<- as.factor(fert$year)
str(fert)
#modelo
mod1<-art(numero~year*trat,data = fert)
anova(mod1)
#grafica de cajas
boxplot(numero~year*trat, data=fert)
# grafica de medias  #
library(Rcmdr)
with(fert,plotMeans(numero, trat, year, error.bars = "se", 
                      col = c("orange","blue"), pch = "+"),lwd= 0.5 )
with(fert,plotMeans(numero, trat, error.bars = "se", 
                    col = "orange", pch = "+"),lwd= 0.5 )

     