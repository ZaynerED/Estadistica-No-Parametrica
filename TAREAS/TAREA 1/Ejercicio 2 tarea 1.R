#limpiar consola 
cat("\014")
#limpiar variables
rm(list=ls())
library(ggplot2)
library(ggthemes)
library(patchwork)
##prueba del signo##
binom.test(9,10,.5,alternative="two.sided")

#datos
conductancia<-read.csv("cond.csv",header = TRUE)

##Prueba de rangos con signos de Wilcoxon##
North<-conductancia$North
South<-conductancia$South
wilcox.test(South, North, paired = TRUE, alternative = "two.sided")
data.frame(South, North)
#boxplot de North
a<-ggplot(conductancia, aes(y = North)) +
  geom_boxplot(fill = "orange", color = "blue") +
  labs(title = "Boxplot de Conductancia de Sur",
       y = "Conductancia") +
  theme_calc()
#boxplot de South
b<-ggplot(conductancia, aes(y = South)) +
  geom_boxplot(fill = "darkgreen", color = "red") +
  labs(title = "Boxplot de Conductancia de Norte",
       y = "Conductancia") +
  theme_calc()
#juntar graficas
combined_plots <- a + b
combined_plots

# Prueba de t #
t.test(South,North, paired = TRUE, alternative = "two.sided")

##Diferencia de medias##
# Calcular las diferencias absolutas
differences <- abs(South - North)

# Calcular la media de las diferencias absolutas
mean_difference <- mean(differences)
mean_difference
