#histograma
datos<- iris$Sepal.Length
hist(datos, main="Histograma de la longitud del sepalo", 
     xlab="Longitud del sepalo", ylab="Frecuencia", 

# densidad
den<- density(datos)
plot(den)

#funcion de distribucion empirica
plot(ecdf(datos))

curve(pnorm(x, mean=mean(datos), sd=sd(datos)), add=TRUE, col="red")
curve(pt(x, df=length(datos)-1), add=TRUE, col="blue")
# son probabilidades acumuladas 

# qqplot
qqnorm(datos);qqline(datos)
require(car)
qqPlot(datos, "norm")
