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
#Ejemplo 2
#Pruebas de bondad de ajuste con paqueterias
#install.packages("fitdistrplus") # EN ESTE CASO PARA RECHAZAR HAY QUE TOMAR EL VALOR MAS PEQUEÑO
#LA DISTANCIA QUE EN EL MODELO WEIBULL ES MAS PEQUEÑO POR ENDE ESTE ES EL MODELO QUE HAY QUE USAR
library(fitdistrplus)
ajuste_normal<-fitdist(trees$Girth,"norm") #hace el ajuste
gofstat(ajuste_normal) # Calcula varias estaddisticas 
plot(ajuste_normal) #grafica
#Ajuste weibull
ajuste_weibull<-fitdist(trees$Girth,"weibull") #hace el ajuste
gofstat(ajuste_weibull) # Calcula varias estaddisticas
plot(ajuste_weibull) #grafica
