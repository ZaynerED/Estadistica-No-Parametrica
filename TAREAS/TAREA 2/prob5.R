#limpiar consola
cat("\014")
#limpiar variables
rm(list=ls())
#limpiar plots
dev.off()
# Datos #
datos3<-read.csv("prob5.csv",header = T)
View(datos3)
head(datos3)
str(datos3)

# Librerias #
library(ARTool)
library(emmeans)
library(dplyr)
library(tidyr)
library(phia)
library(nortest)
library(ggplot2)
# Parcelas divididas (parametrico) #
# Análisis de varianza #
anova_par_div<-aov(Yield ~ blk+ Nitrogen*Rate + 
Error(blk:Nitrogen), data = datos3)
summary(anova_par_div)

# Prueba de Tukey #
anova_simplified <- aov(Yield ~ blk + Nitrogen * Rate, data = datos3)

tukey_result <- TukeyHSD(anova_simplified)
tukey_result
plot(tukey_result)

# Grafico de interacción #
interaction.plot(datos3$Nitrogen, datos3$Rate, datos3$Yiel)
interaction.plot(datos3$Nitrogen, datos3$Rate, datos3$Yield,
                 type = "l",    
                 ylab= "Yield",
                 xlab = "Nitrogen",
                 col = c("blue4", "red4","green","orange"),
                 lty = 1,  
                 lwd = 2, 
                 trace.label = "Rate",
                 xpd = FALSE)

#Diferentes 
# Ajuste de datos #
datos3$Yield<-as.numeric(datos3$Yield)
datos3$Nitrogen<-as.factor(datos3$Nitrogen)
datos3$Rate<-as.factor(datos3$Rate)
datos3$blk<-as.factor(datos3$blk)
str(datos3)


# Verificación de supuestos # 
# Independencia #
par(mfrow = c(2,2))
qqnorm(datos3[datos3$Rate=="1","Yield" ], main="Var1")
qqline(datos3[datos3$Rate=="1","Yield" ])
qqnorm(datos3[datos3$Rate=="2","Yield" ], main="Var2")
qqline(datos3[datos3$Rate=="2","Yield" ])
qqnorm(datos3[datos3$Rate=="3","Yield" ], main="Var3")
qqline(datos3[datos3$Rate=="3","Yield" ])
qqnorm(datos3[datos3$Rate=="4","Yield" ], main="Var4")
qqline(datos3[datos3$Rate=="4","Yield" ])
par(mfrow = c(1,1))
# Test de hipotesis # 
# Dado que los grupos tienen mas de 50 eventos se emplea el  #
# test de Kolmogorov-Smirnov con la corrección de Lilliefors.#

by(data = datos3,INDICES = datos3$Rate,
   FUN = function(x){ lillie.test(x$Yield)})
# Homocedasticidad #

# Dado que hay un grupo (Rate 2) que se encuentra en el límite 
# para aceptar que se distribuye de forma normal, 
# el test de Fisher y el de Bartlett no son recomendables. 
# En su lugar es mejor emplea un test basado en la mediana 
# test de Levene o test de Fligner-Killeen.

fligner.test(Yield ~ Rate, data = datos3)
# Con una confiabilidad de 95 % y 
# de acuerdo con el test de Fligner-Killeen con un p-value de 0.8335
# se acepta la hipótesis de homocedasticidad.es decir; 
# las varianzas son iguales.

# Parcelas divididas (no parametrico) con ArTool #
# Análisis de varianza #
anova_rangos<- art(Yield ~ Nitrogen*Rate+ (1|blk),data=datos3)
anova(anova_rangos)
# Prueba de Tukey #
media<-artlm(anova_rangos,"Nitrogen:Rate")
marginal<-emmeans(media, ~Nitrogen*Rate)
marginal

pares<-pairs(marginal,adjust = "tukey")
pares
plot(marginal)+theme_minimal()
plot(pares)
