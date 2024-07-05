library(readr)
LLUVIA <- read.csv("D:/Sahori/METODOS NO PARAMETRICOS/TAREA 2/LLUVIA.csv")
view(LLUVIA)
plot(LLUVIA$Tratamiento,LLUVIA$Variabilidad, data=LLUVIA)

library(ggplot2)
ggplot (data=LLUVIA,mapping=aes(x=Tratamiento, y=Variabilidad))+
  geom_point(shape=52,size=2)


boxplot(LLUVIA$Variabilidad~LLUVIA$Tratamiento)


#KOLMOGOROV
#H0=normal vs. HA=no normal
ks.test(LLUVIA$Variabilidad,pnorm,mean(LLUVIA$Variabilidad),sd(LLUVIA$Variabilidad))

#ANSARI-BRADLEY
ansari.test(LLUVIA$Variabilidad~LLUVIA$Tratamiento)

#BOXPLOT
boxplot(Variabilidad~Tratamiento, data=LLUVIA,
        col = rainbow(52))
