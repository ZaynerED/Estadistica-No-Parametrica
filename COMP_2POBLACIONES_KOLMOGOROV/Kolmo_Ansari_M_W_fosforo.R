#limpiar datos
rm(list=ls())
#limpiar graficos
dev.off()
#limpiar consola
cat("\014")

#datos
datos<-read.csv("mannw_fosfo.csv",header=T)
datos

boxplot(P~Trat,datos)

#prueba de MANN WITHNEY
wilcox.test(P~Trat,datos)

#prueba de T
t.test(P~Trat,datos, var.equal=TRUE,alternative="two.sided", alpha=0.05)
#prueba de ANSARI
ansari.test(P~Trat,datos, var.equal=TRUE,alternative="two.sided", alpha=0.05)
#PRUEBA DE KOLMOGOROV
ks.test(P~Trat,datos,alternative="two.sided")
#otra forma de hacerlo
library(fBasics)
res<-datos[1:10,2]
res

nr<-datos[11:20,2]
nr
ks2Test(nr,res)
