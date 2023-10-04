# Figura 4
# gráfica 3D
# dev.off()
library(scatterplot3d)
scatterplot3d(salida[,-1], type = "l", lwd = 1, xlab = "X",
              ylab = "Y", zlab = "Z", main = "El atractor de Chen", 
              col.main="red",color=("darkorchid"),box=FALSE,angle=45)
              


