#Clasificacion de vinos con el uso de random forest 
#Limpiar consola
rm(list=ls())
cat("\014")
#Cargamos las librerias necesarias
set.seed(1234) #garantiza la reproducibilidad de los resultados
library(randomForest)
#Con las predicciones se puede conocer el tipo de vino (variedad) con la 
# informacion de las variables dadas
vino<-read.csv("vino.csv",header=T)
#View(vino)
#Tenemos que pasar a factor el type (clasificacion, de esta manera se asume la clasificacion
# y no regresion
vino$type<-as.factor(vino$type)
#Se construye el modelo para conocer la importancia de las variables 
modelo_vino<-randomForest(type~.,data=vino,importance=TRUE, ntree=100) #tuning, para cuadrar el numero de arboles
modelo_vino #la matriz de confusion me ayuda a conocer la precision del modelo
plot(modelo_vino)
#Importancia de las variables
importance(modelo_vino) 
varImpPlot(modelo_vino) #Cononozco la variables mas importantes

#Despues se pueden hacer predicciones con el modelo con solo las variables
# que se deeterminaron mas importantes
modelo_vino2<-randomForest(type~color,data=vino,importance=TRUE)
modelo_vino2
plot(modelo_vino2)
