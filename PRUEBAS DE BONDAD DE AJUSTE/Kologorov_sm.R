#PRUEBAS DE BONDAD DE AJUSTE

#KOLMOGOROV SMIRNOV
# Se usa a para variables continuas
# Se basa en la diferencia entre la función de distribución empírica y la teórica (DISTANCIA MAXIMA)
# Se calcula la diferencia máxima entre ambas funciones
# Se compara con la tabla de Kolmogorov-Smirnov
# Se rechaza la hipótesis nula si el estadístico es mayor que el valor crítico
# Se acepta la hipótesis nula si el estadístico es menor que el valor crítico
# Ese valor critico es la DIFERENCIA MAXIMA DE KOLMOGOROV
# Se usa la función ks.test(datos, "pnorm", mean=mean(datos), sd=sd(datos))
