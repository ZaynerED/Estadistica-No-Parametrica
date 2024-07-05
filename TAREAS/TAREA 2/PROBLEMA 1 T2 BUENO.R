Concentracion <- read.csv("D:/Sahori/METODOS NO PARAMETRICOS/TAREA 2/Concentracion.csv")
View(Concentracion)
boxplot(Concentracion$mercurio~Concentracion$taxon,
        col = rainbow(68))
kruskal.test(Concentracion$mercurio~Concentracion$taxon)

#ANOVA
Modelo=aov(Concentracion$mercurio~Concentracion$taxon)
summary(Modelo)
anova(Modelo)
Residuos=Modelo$residuals
shapiro.test(Residuos)

#DUNN
library(PMCMRplus)
mercurio=Concentracion$mercurio
taxon=as.factor(Concentracion$taxon)
kwAllPairsDunnTest(x=mercurio, g=taxon,
                   dist="Tukey",
                   p.adjust.method = "holm")

#NEMENYI
library(PMCMRplus)
kwAllPairsNemenyiTest(x=mercurio, g=taxon,
                      dist="Tukey",
                      p.adjust.method = "holm")