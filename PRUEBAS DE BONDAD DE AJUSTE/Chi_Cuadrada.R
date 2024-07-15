#PRUEBAS DE BONDAD DE AJUSTE

#CHI CUADRADA
# Prueba diseñada para variables Discretas, Categoricas, Continuas
# Se basa en la comparación de la frecuencia observada con la frecuencia esperada
# Se calcula la diferencia entre la frecuencia observada y la esperada
# Se eleva al cuadrado y se divide entre la frecuencia esperada
# Se suman los valores obtenidos
# Se compara con un valor crítico de la distribución Chi Cuadrada
# Si el valor calculado es mayor que el valor crítico se rechaza la hipótesis nula
# Si el valor calculado es menor que el valor crítico se acepta la hipótesis nula


#metodo de poisson con chi cuadrada
data<-data.frame(x=(0:4),frec=c(2962,382,47,25,4))
library(vcd)                 
library(data.table)
