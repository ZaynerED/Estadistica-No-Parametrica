Tarea_vitalidad <- read.csv("C:/Users/janet/Desktop/Tarea_vitalidad.csv")
View(Tarea_vitalidad)
Library(ARTool)
data(Tarea_vitalidad)
with(Tarea_vitalidad, interaction.plot(x.factor = Area,trace.factor = Año, 
response=Escala, fun = mean, type = "1", ylab = "Nivel de Contaminacion", xlab = "Año", col = rainbow(5)))

