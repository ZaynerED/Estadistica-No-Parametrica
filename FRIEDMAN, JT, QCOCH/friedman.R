library(agricolae)
data("grass")
pasto<-grass
View(pasto)
?grass
# Friedman test
#Ho: Me1=Me2=Me3
#Ha: At least one pair of treatments is different
names(pasto)
str(pasto)
pasto$judge<-as.factor(pasto$judge)
friedman.test(pasto$evaluation,pasto$trt,pasto$judge)
#otra forma
attach(pasto)
friedman.test(evaluation,trt,judge)
#Al menos uno de los pastos difiere de los otros
boxplot(evaluation~trt)
#nemenyi
library(PMCMRplus)
kwAllPairsNemenyiTest(x=evaluation,g=trt,dist = "Tukey")
pasto
#Exportar tabla de datos a excel
write.csv(pasto,"pasto.csv")
#Prueba de Quade
#quade.test(evaluation~trt|judge, data = pasto)
