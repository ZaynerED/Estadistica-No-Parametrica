#install.packages("correlation")
library(correlation)
# libreria correlation para calcular la correlacion 
# de pearson

# libreria datawizard para transformar los datos a 
# rangos 

#Ejemplo 

#limpiar consola
cat("\014")
#limpiar variables
rm(list=ls())
#limpiar plots~
dev.off()

#Datos
csv <-"https://raw.githubusercontent.com/walmes/EACS/master/data-raw/teca_qui.csv"
teca <- read.csv2(file = csv, dec =".")
str(teca)
teca2<-teca[,-c(1,2)]
head(teca2)
cor(teca2$ph,teca2$ctc)
plot(teca2$ph,teca2$ctc)
library(ggplot2)
ggplot(teca2, aes(x=ph, y=ctc)) + 
        geom_point() + 
        geom_smooth(method=lm,se=FALSE)

cor.test(teca2$ph,teca2$ctc)

#No parametrico
cor.test(teca2$ph,teca2$ctc, method = "spearman")
cor.test(teca2$ph,teca2$ctc, method = "kendall")
library(correlation)
#todas las variables
correlation(teca2)
plot(correlation(teca2))
#por variables 
correlation(teca2,select = c("ph", "ctc"), method = "spearman")
library(PerformanceAnalytics)
chart.Correlation(teca2, method = "kendall")
