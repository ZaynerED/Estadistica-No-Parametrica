#limpiar datos
rm(list=ls())
#limpiar consola
cat("\014")
#borrar graficos
dev.off()
#CASO KRUSCAL WALLIS
library(tidyverse)
library(hrbrthemes)
library(ggplot2)
library(ggthemes)
#datos
datos<-read.csv("datos_paper.csv",header = T)
View(datos)

#tranformar region en factor de estudio
datos$reg<-as.factor(datos$reg)
str(datos)

# exploracion de datos
boxplot(datos$ph~datos$reg)
# agregar colores y titulos
boxplot(datos$ph~datos$reg, 
        col = c("red","blue","green","yellow","purple","orange","cyan"), 
        main = "Boxplot de pH por región", xlab = "Región", ylab = "pH")+
        theme_classic()
#Con ggplot
ggplot(datos, aes(x=reg, y=ph, fill=reg))+
  geom_boxplot()+
  theme_minimal()+
  theme(legend.position = "none",lege)+
  labs(title = "Boxplot de pH por región", x = "Región", y = "pH")
#prueba de kruscal wallis
kruskal.test(datos$ph~datos$reg)
#nemeny
library(PMCMR)
library(PMCMRplus)
#nemenyi
kwAllPairsNemenyiTest(x=datos$ph,g=datos$reg, dist="Tukey")
#duncan
kwAllPairsDunnTest(x=datos$ph,g=datos$reg, dist="Tukey")
