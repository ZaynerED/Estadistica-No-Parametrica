library(ggplot2)
##Prueba de Mann Withney##
Ejercicio.3 <- read.csv("Ejercicio 3.csv")
#View(Ejercicio.3)

##Para variable categorica##
Ejercicio.3$Condicion=as.factor(Ejercicio.3$Condicion)
wilcox.test(Respiracion~Condicion, data=Ejercicio.3)

# Gráfica Boxplot #
ggplot(Ejercicio.3, aes(x=Condicion, y=Respiracion)) + 
        geom_boxplot(fill = "orange", color = "blue")+ 
        theme_calc()
##Prueba de t parametrica##
t.test(Respiracion~Condicion, data=Ejercicio.3)

##ANOVA##
Resultado=aov(Respiracion~Condicion, data=Ejercicio.3)
anova(Resultado)
#Prueba de normalidad
resid<-resid(Resultado)
shapiro.test(resid)

