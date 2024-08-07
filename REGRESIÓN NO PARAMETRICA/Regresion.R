#limpiar la consola
cat("\014")
rm(list=ls())
library(agridat)
#datos
data("cate.potassium")
cotton=cate.potassium
cotton

plot(cotton$potassium, cotton$yield, pch=19, col="blue", xlab="Potasio", ylab="Rendimiento")
library(ggplot2)
g<-ggplot(cotton, aes(x=potassium, y=yield))+ 
        geom_point(col="#ff360e") + geom_smooth(method="lm", se=T) + theme_bw() +
        labs(title="Rendimiento de algodón vs Potasio", x="Potasio", y="Rendimiento")
#parametrica
ajuste_reg<-lm(yield~potassium, data=cotton)
summary(ajuste_reg)
#ajuste cuadratico
ajuste_cuad<-lm(yield~potassium+I(potassium^2), data=cotton)
summary(ajuste_cuad)
plot(cotton$potassium, cotton$yield, pch=19, col="blue", xlab="Potasio", ylab="Rendimiento")
lines(cotton$potassium, fitted(ajuste_cuad), col="red")

# Ajuste no parametrico
# regresion local
ajuste_reg_local<-supsmu(cotton$potassium, cotton$yield)
ajuste_reg_local
plot(cotton$potassium, cotton$yield)
lines(ajuste_reg_local$x,ajuste_reg_local$y, col="red")

ggplot(cotton, aes(x=potassium, y=yield))+ 
        geom_point(col="#ff360e") + geom_smooth(method="loess", se=T) + theme_bw() +
        labs(title="Rendimiento de algodón vs Potasio", x="Potasio", y="Rendimiento")

#metodo de splines
library(splines)
ajuste_splines<-smooth.spline(cotton$yield~cotton$potassium,cv=TRUE)
plot(cotton$potassium, cotton$yield, pch=19, col="blue", xlab="Potasio", ylab="Rendimiento")
lines(ajuste_reg_local$x,ajuste_reg_local$y, col="red")
lines(ajuste_splines$x,ajuste_splines$y, col="green")
