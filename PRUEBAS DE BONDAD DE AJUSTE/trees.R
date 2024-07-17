#limpiar datos
rm(list=ls())
#limpiar consola
cat("\014")
data(trees)
#Metodos graficos
#histograma
hist(trees$Girth,20)
#histograma suavizado
plot(density(trees$Girth))
#?trees     
#qqplot
qqnorm(trees$Girth)
qqplot(trees$Girth,dist="exp")
#funcion acumulativa
curva<-ecdf(trees$Girth)
plot(curve)
qqnorm(trees$Girth)
# Ho Normal
# Ha No normal

#  Prueba de Kolmogorov-Smirnov ####### 
media= mean(trees$Girth)
sd1= sd(trees$Girth)
ks.test(trees$Girth,"pnorm",mean=media,sd=sd1)

#grafica de funcion acumulativa
curva1<-ecdf(trees$Girth)
#empirirca
curve(ecdf(trees$Girth)(x),xlim = extendrange(trees$Girth),type="s",lwd=2)

#normal
curve(pnorm(x,mean=media,sd=sd1),add=TRUE,col="red",lwd=2)

#Pruebas de bondad de ajuste con paqueterias
#install.packages("fitdistrplus")
library(fitdistrplus)
