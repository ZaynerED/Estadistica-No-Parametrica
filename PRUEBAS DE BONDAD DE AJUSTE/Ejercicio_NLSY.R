#limpiar datos
rm(list=ls())
#limpiar consola
cat("\014")
#limpiar graficos
dev.off()

# Se necesita realizar ANOVA, y se probaran supuestos de normalidad
# Nos interesa saber si hay diferencia en el ingreso de las personas en el 2005
 
datos<-read.csv("NLSY.csv")
str(datos)
View(datos)
library(ggplot2)
ggplot(datos,aes(x=Educ,y=Income2005))+
        geom_point()
Anova_salario<-aov(Income2005~Educ,data=datos)
summary(Anova_salario)
boxplot(Income2005~Educ,data=datos)
# Prueba de normalidad, Esta se hace por medio de la prueba de Shapiro-Wilk y sobre los 
# residuales del ANOVa
residuales_anova<-resid(Anova_salario)
#grafica qqplot
library(car)
qqPlot(residuales_anova,distribution = "norm")
shapiro.test(residuales_anova) #No son normales
ks.test(residuales_anova,"pnorm",mean=mean(residuales_anova),sd=sd(residuales_anova)) #No son normales

#NO SE CUMPLIO EL SUPUESTO DE NORMALIDAD, SE HARA UNA PRUEBA NO PARAMETRICA
#se corre no parametrico
kruskal.test(Income2005~Educ,data=datos)

# Se sospecha de la veracidad de los datos aleatorios, se hara
# una prueba de aleatoriedad
# Prueba de aleatoriedad

