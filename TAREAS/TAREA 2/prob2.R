#limpiar paneles
rm(list=ls())
#limpiar consola
cat("\014")
#limpiar graficos
dev.off()

# datos
prob2<-read.csv("prob2.csv",header=TRUE)
str(prob2)
#View(prob2)
prob2$muestra<-as.factor(prob2$muestra)
prob2$num_lab<-as.factor(prob2$num_lab)
#librerias
library(ggplot2)
library(agricolae)
library(ggpubr)
# Friedman Test
friedman.test(prob2$bac_tot, prob2$num_lab, prob2$muestra)
# de acuerdo a la prueba de Friedman, se rechaza
# la hipotesis nula de que no hay diferencias
# entre los tratamientos y se concluye que al menos
# un tratamiento es diferente a los demas

#boxplot
ggplot(prob2, aes(x = num_lab, y = bac_tot, fill=num_lab)) +
        geom_boxplot() +
        labs(title = "Comparación de Medias de tres Laboratorios",
             x = "Número de Laboratorio",
             y = "Bacterias Totales") +
        theme_classic()


library(PMCMRplus)

# test post-hoc de Nemenyi
nemenyi_result <- frdAllPairsNemenyiTest(bac_tot ~ num_lab | muestra, data = prob2)
print(nemenyi_result)

