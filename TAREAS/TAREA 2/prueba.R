library(ggplot2)
library(agricolae)
library(multcomp)
library(ggpubr)
library(PMCMRplus)

# Cargar los datos y transformar las variables
prob2 <- read.csv("prob2.csv", header = TRUE)
prob2$muestra <- as.factor(prob2$muestra)
prob2$num_lab <- as.factor(prob2$num_lab)

# Paso 1: Realizar la prueba de Friedman
friedman_result <- friedman.test(bac_tot ~ num_lab | muestra, data = prob2)
print(friedman_result)

# Paso 2: Aplicar el test post-hoc de Nemenyi
nemenyi_result <- frdAllPairsNemenyiTest(bac_tot ~ num_lab | muestra, data = prob2)
print(nemenyi_result)

# Extraer las letras de comparación de medias
nemenyi_letters <- multcompLetters(nemenyi_result$p.value)
print(nemenyi_letters)

# Crear un data frame con las letras para ggplot
nemenyi_summary <- data.frame(num_lab = names(nemenyi_letters$Letters), 
                              Letters = nemenyi_letters$Letters)

# Paso 3: Crear el boxplot con letras de comparación de medias
ggplot(prob2, aes(x = num_lab, y = bac_tot, fill = num_lab)) +
        geom_boxplot() +
        geom_text(data = nemenyi_summary, aes(x = num_lab, y = max(prob2$bac_tot) + 1, label = Letters),
                  vjust = 0) +
        labs(title = "Comparación de Medias de tres Laboratorios",
             x = "Número de Laboratorio",
             y = "Bacterias Totales") +
        theme_pubr()


