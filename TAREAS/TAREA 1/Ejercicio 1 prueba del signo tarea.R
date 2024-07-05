#limpiar consola 
cat("\014")
#limpiar variables
rm(list=ls())
library(ggplot2)
library(ggthemes)
#Datos
river<-read.csv("river.csv",header = TRUE)
Flujo<-river$Flow
# Generar el boxplot
ggplot(river, aes(y = Flujo)) +
  geom_boxplot(fill = "orange", color = "blue") +
  labs(title = "Boxplot de Flujos Anuales para el Río Conecuh",
       y = "Flujo (cfs)") +
  theme_calc()
##Prueba del signo##
binom.test(8,19,.5,alternative="less")


##Prueba de rangos con signos de Wilcoxon##

wilcox.test(Flujo,mu=683,alternative="less")

##Prueba de t##

t.test(Flujo, mu = 683, alternative = "less")
#Grafica QQplot de Flujo con ggplo2
ggplot(river, aes(sample = Flujo)) +
  stat_qq() +
  stat_qq_line() +
  labs(title = "QQplot de Flujos Anuales para el Río Conecuh",
       x = "Cuantiles Teóricos",
       y = "Cuantiles Observados") +
  theme_calc()

shapiro.test(resi)
