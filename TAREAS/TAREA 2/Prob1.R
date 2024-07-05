dat_pro1<-read.csv("prob1.csv", header = TRUE)
dat_pro1
str(dat_pro1)
dat_pro1$loc<-factor(dat_pro1$loc)
dat_pro1$long<-as.numeric(dat_pro1$long)
library(ggplot2)
library(ggpubr)
#boxplot
ggboxplot(dat_pro1, x = "loc", y = "long",
          xlab= "Localidad",ylab="Longitud media de las hojas (cm)", 
          color = "loc", palette = "jco",
          add = "jitter", facet.by = NULL, ggtheme = theme_pubr())
        
# prueba de kruscal-wallis
kruskal.test(long ~ loc, data = dat_pro1)
# se concluye que hay diferencias significativas 
# en la longitud de las hojas entre las localidades
#Para conocer que localidad es la que tiene mayor longitud de hoja
# se realizara la prueba de Nemenyi y Duncan
library(PMCMRplus)
kwAllPairsNemenyiTest(dat_pro1$long, dat_pro1$loc, dist = "Tukey")
kwAllPairsDunnTest(dat_pro1$long, dat_pro1$loc, dist = "Tukey")
#ANOVA de una via
anova1<-aov(long ~ loc, data = dat_pro1)
summary(anova1)

#supuestos de normalidad
shapiro.test(anova1$residuals)

#homocedasticidad
bartlett.test(long ~ loc, data = dat_pro1)
#Grafica de barras de medias tukey
ggbarplot(dat_pro1, x = "loc", y = "long",
          xlab= "Localidad",ylab="Longitud media de las hojas (cm)", 
          color = "loc", palette = "jco",
          add = "jitter", facet.by = NULL, ggtheme = theme_pubr())
