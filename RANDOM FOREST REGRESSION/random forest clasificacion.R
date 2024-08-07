#RANDOM FOREST PARA CLASIFICACIÓN "MATCHING LEARNING"
frijol=read.csv("tarea2.6.csv", header=T)
frijol
frijol$Class=as.factor(frijol$Class)
str(frijol)

boxplot(frijol$EquivDiameter~frijol$Class)
#ajuste de modelo
library(randomForest)
modelo_forest=randomForest(Class~.,data=frijol, importance=T)#el punto es para que tome todas las variables
modelo_forest
#importancia de las variables
varImpPlot(modelo_forest)
#importancia con libreria
library(randomForestExplainer)
importance(modelo_forest,type =2 )

plot(modelo_forest)

#predicciones 
modelo2=randomForest(Class~roundness+ShapeFactor4+Solidity,data=frijol, importance=T )
modelo2
#clasificacion de semillas nuevas
frijoles=read.csv("frijol2.csv", header=T)
frijoles
predict(modelo2,newdata = frijoles)
