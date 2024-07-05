#limpiar consola
cat("\014")
#limpiar variables
rm(list=ls())
#limpiar plots
dev.off()

prob4<-read.csv("prob4.csv", header= T)
View(prob4)
prob4$groups<-as.factor(prob4$groups)
#Cargar librerias
library(PMCMRplus)
library(PMCMR)
names(prob4)
#Prueba de Jonckheere-Terpstra
jonckheereTest(prob4$counts, prob4$groups, alternative = "greater")
# de acuerdo a la prueba anterior se rechaza la hipotesis nula, 
# por lo que se puede decir que hay una tendencia creciente en la variable counts

#grafico de barras para la variable counts
library(ggplot2)
library(ggpubr)
#boxplot
ggplot(prob4, aes(x=groups, y=counts, fill=groups)) + 
  geom_boxplot()+
  theme_pubr()+
  labs(title="Recuentos Diferenciales de Plasmatocitos (%) ", 
       x="Grupos", 
       y="Plasmocitos (%)")
