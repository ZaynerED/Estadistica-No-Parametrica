#limpiar paneles
rm(list=ls())
#limpiar consola
cat("\014")
vital<-read.csv("vital.csv",header=T)
str(vital)
vital$Area<-as.factor(vital$Area)
vital$Año<-as.factor(vital$Año)
str(vital)
library(Rcmdr)
# gráfica de interacción #
with(vital,plotMeans(Calif, Año, Area, error.bars = "se", 
                    col = c("orange","blue","red"), pch = "+"),lwd= 0.5 )
# analisis #
library(lmerTest)
library(emmeans)
library(ARTool)
# analisis mixto #
modelo_arbol_mixto<-lmer(Calif~Año*Area+(1|numero),data=vital)
summary(modelo_arbol_mixto)
anova(modelo_arbol_mixto)
shapiro.test(residuals(modelo_arbol_mixto))

# analisis no parametrico #
modelo_arbol_no_parametrico<-art(Calif~Año*Area+(1|numero),data=vital)
anova(modelo_arbol_no_parametrico)
