#limpiar datos
rm(list=ls())
#lmipiar la consola
cat("\014")
library(ggplot2)
library(ggpubr)
# Nos interesa saber si hay diferencias significativas
# en los indicadores de diversidad, Shanon y Simpson

#Cargamos datos
datos <- read.csv("shanoon.csv", header = T)
str(datos)
attach(datos)

####################### SHANON ############################
#anova
anova_shanoon <- aov(Shannon ~ Sitio, data = datos)
summary(anova_shanoon)
#barplot(Shannon ~ Sitio, data = datos)
#Residuales
resid_shanoon <- residuals(anova_shanoon)
#normalidad 
shapiro.test(resid_shanoon)
#corremos no parametrico 
kruskal.test(Shannon ~ Sitio, data = datos)

#grafica de barras en ggplot
par(mfrow=c(1,1))

ggplot(datos, aes(x=Sitio, y=Shannon)) + 
        geom_bar(stat="identity", fill="#D35400")+
        theme_grey()+
        xlab("Sitio")+
        ylab("Indice de Shannon")+
        ggtitle("Indice de Shannon por Sitio")

####################### SIMPSON ############################
#anova
anova_simpson <- aov(Simpson ~ Sitio, data = datos)
summary(anova_simpson)
#barplot(Simpson ~ Sitio, data = datos)
#Residuales
resid_simpson <- residuals(anova_shanoon)
#normalidad 
shapiro.test(resid_simpson)
#corremos no parametrico
kruskal.test(Simpson ~ Sitio, data = datos)
#grafica
ggplot(datos, aes(x=Sitio, y=Simpson)) + 
        geom_bar(stat="identity", fill="#82E0AA")+
        theme_gray()+
        xlab("Sitio")+
        ylab("Indice de Shannon")+
        ggtitle("Indice de Simpson por Sitio")
