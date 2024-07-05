#limpiar datos
rm(list=ls())
#limpiar consola
cat("\014")
#borrar graficos
dev.off()

#############################
drog<-read.csv("adicciones.csv",header=T)
head(drog)
#View(drog)
drog$alc<-as.factor(drog$alc)
drog$cig<-as.factor(drog$cig)
drog$mari<-as.factor(drog$mari)
#modelo marginal
mod1<-glm(frecc~alc+cig+mari, family = poisson(link= "log"),data=drog)
mod1
summary(mod1)
#modelo alc*cig
mod2<-glm(frecc~alc+cig+mari+alc*cig, family = poisson(link= "log"),data=drog)
mod2
summary(mod2)
#modelo ma*al
mod3<-glm(frecc~alc+cig+mari+mari*alc, family = poisson(link= "log"),data=drog)
mod3
summary(mod3)
#modelo saturado
mod4<-glm(frecc~alc+cig+mari+alc*cig+mari*alc+mari*cig, family = poisson(link= "log"),data=drog)
mod4
summary(mod4)
#modelo sin interaccion triple. este es el mejor modelo con el AIC mas bajo #el valor AIC
# sera el mejor modelo
mod5<-glm(frecc~alc+cig+mari+alc*cig+mari*alc, family = poisson(link= "log"),data=drog)
mod5
summary(mod5)
#modelo sin ci*ma
mod6<-glm(frecc~alc+cig+mari+alc*cig+mari*alc, family = poisson(link= "log"),data=drog)
mod6
summary(mod6)
#paso previo a ACP