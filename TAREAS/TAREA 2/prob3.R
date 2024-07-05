#limpiar consola
cat("\014")
#limpiar variables
rm(list=ls())
#limpiar plots
dev.off()
library(ggplot2)
library(ggpubr)
library(extrafont)
#font_import()
#loadfonts(device = "win")

#Datos###################################3
dat3<-read.csv("prob3.csv", header=T)
View(dat3)
dat3
head(dat3)
str(dat3)

#boxplot
ggboxplot(dat3, x = "trat", y = "rain",main="Lluvia por tratamiento",
          xlab= "Tratamiento",ylab="Lluvia (mm)", 
          color = "trat", palette = "jco",
          add = "jitter", facet.by = NULL, ggtheme = theme_pubr())+
     theme(text = element_text(family = "Cambria"))

# Prueba de ANSARI
ansari.test(rain~trat,dat3, var.equal=TRUE,alternative="two.sided", alpha=0.05)
# Se concluye que no hay diferencias significativas en la varianza de la lluvia
# entre los tratamientos
# Prueba de  KOLMOGOROV
ks.test(rain~trat,dat3,alternative="two.sided")
# se concluye que no hay diferencias significativas en la distribucion de la lluvia
# entre los tratamientos