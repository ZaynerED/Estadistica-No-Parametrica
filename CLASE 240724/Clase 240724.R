# Clases 240724
# Clases no paramétrica

datos <- read.csv("so4.csv")
datos

# Grafica de datos
plot(datos$latitude, datos$longitud)

# Gráfica tridimensional
library(scatterplot3d)
scatterplot3d(datos$latitude, datos$longitud, datos$so4, pch=10, 
              color="blue", type = "h", highlight.3d = TRUE, angle = 50)

# Curva no paramétrica mediante modelo GAM

library(mgcv)
library(mgcViz)

ajuste_so4_GAM <- gam(so4 ~ te(latitude, longitude, k=c(1, 1)), data = datos)
summary(ajuste_so4_GAM)

# Graficar 
library(rgl)
plot3d(ajuste_so4_GAM)
plot3d(ajuste_so4_GAM, image=TRUE, theta=30, phi=30, col="blue")

# Gráfica con mgcViz
vis.gam(ajuste_so4_GAM)
vis.gam(ajuste_so4_GAM, plot.type="contour", color = "topo",
        theta = 30, phi = 30)

library(plot3D)
g1 = getViz(ajuste_so4_GAM)
plot(sm(g1, 1))+l_fitRaster()+ l_fitContour()+ l_points()+l_rug()

# Plot RGL

plotRGL(sm(g1, 1),  theta = 30, phi = 30, image = TRUE, col = "blue")





