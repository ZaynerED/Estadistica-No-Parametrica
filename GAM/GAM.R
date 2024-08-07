#MODELO GAM 2
#APLICACIÓN EN MODELACIÓN DE CURVAS DE CRECIMIENTO 
#MEDIDAS REPETIDAS
#limpiar paneles
rm(list=ls())
#limpiar consola
cat("\014")
#CARGAR DATOS 
DATOS=read.csv(("GAM.csv"),header = TRUE)
#CREAR GRAFICAS
library(ggplot2)
DATOS$VARIEDAD=as.factor(DATOS$VARIEDAD)
ggplot(DATOS,aes(x=PERIODO,y=RENDIMIENTO, colour = VARIEDAD))+
  geom_point()+
  geom_smooth(method = "gam")+
  labs(x="corte",y="rendimiento")
#SEGUNDO EJERCICIO
#APLICACIÓN EN MODELACIÓN DE CURVAS DE CRECIMIENTO 
#MEDIDAS REPETIDAS
#limpiar paneles
rm(list=ls())
cat("\014")
#CARGAR DATOS 
DATOS2=read.csv(("said1.csv"),header = TRUE)
#CREAR GRAFICAS
library(ggplot2)
DATOS2$Variety=as.factor(DATOS2$Variety)
ggplot(DATOS2,aes(x=Cut,y=Yield, colour = Variety))+
  geom_point()+
  geom_smooth(method = "gam")+
  labs(x="corte",y="rendimiento")
#grafica de acumulados 
ggplot(DATOS2,aes(x=Cut,y=Acum, colour = Variety))+
  geom_point()+
  geom_smooth(method = "gam",se=FALSE)+
  labs(x="corte",y="rendimiento acumulado")
#false es para quitar el sombreado del la dev. estandar
library(mgcv)
library(mgcViz)
modelo_curvas=gam(Yield~Variety+s(Cut,k=5,bs="ps",by=Variety),data = DATOS2)
summary(modelo_curvas)
anova(modelo_curvas)
#si existe diferencia en la interacción entre vatiedad*corte 
#modelo para respuestas binarias
#limpiar paneles
rm(list=ls())
cat("\014")
#CARGAR DATOS 
DATOS3=read.csv(("HERBICIDA.csv"),header = TRUE)
modelo_gam.binario=gam(RESPUESTA~s(DOSIS, k=4),binomial(),data = DATOS3)
summary(modelo_gam.binario)
plot(modelo_gam.binario)
#si es diferente a 0 si existe diferencia 

