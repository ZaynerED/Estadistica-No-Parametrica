#limpiar consola
cat("\014")
#limpiar variables
rm(list=ls())
#limpiar plots
dev.off()
#Datos
dat7<-read.csv("prob7.csv",header = T)
#View(dat7)
library(ggplot2)
library(skimr)
library(dplyr)
# Explorar los datos
glimpse(dat7)
copy_dat7<- as.data.frame(lapply(dat7[,-17], as.numeric))
# Comprobar normalidad de los datos 
skim(copy_dat7[,-17])
# Correlación de los datos

library(corrplot)
# Nivel de confiabilidad
testRes <- cor.mtest(copy_dat7, conf.level = 0.95)

# Parametrico (Pearson)
P <- dat7 %>% 
        select(where(is.numeric)) %>% 
        cor()
round(P, 2)

corrplot(P, p.mat = testRes$p, method = 'circle', type = 'lower', insig='blank',
         tl.col = 'black', addCoef.col ='black',tl.cex= .8, 
         number.cex = 0.6, order = 'AOE', diag=FALSE,
         cl.ratio = 0.2, tl.srt = 45, col = COL2('PiYG', 10),number.font = 1.5)
title("Correlación de Pearson")
#Spearmann

R <- dat7 %>% 
        select(where(is.numeric)) %>% 
        cor(method = 'spearman')
round(R, 2)

corrplot(R, p.mat = testRes$p, method = 'circle', type = 'lower', insig='blank',
         tl.col = 'black', addCoef.col ='black',tl.cex= .8, 
         number.cex = 0.6, order = 'AOE', diag=FALSE,
         cl.ratio = 0.2, tl.srt = 45, col = COL2('PiYG', 10),number.font = 1.5)
title("Correlación de Spearmann")
#Kendall
K <- dat7 %>% 
        select(where(is.numeric)) %>% 
        cor(method = 'kendall')
round(K, 2)

corrplot(K, p.mat = testRes$p, method = 'circle', type = 'lower', insig='blank',
         tl.col = 'black', addCoef.col ='black',tl.cex= .8, 
         number.cex = 0.6, order = 'AOE', diag=FALSE,
         cl.ratio = 0.2, tl.srt = 45, col = COL2('PiYG', 10),number.font = 1.5)
title("Correlación de Kendall")

library(ggpubr)

#Diferencia variedaes (Class) respecto a la variable Perimeter
# Test de Kruscakl-Wallis
kruskal.test(Perimeter ~ Class, data = dat7)

ggboxplot(dat7, x = "Class", y = "Perimeter", 
          color = "Class", palette = "jco", 
          ylab = "Perimeter", xlab = "Class",)+
        geom_jitter(color="black", size=0.4, alpha=0.9)+
        theme_pubr()

