# Figura 3
# El Sistema de Chen
# Valores de los parámetros 
param =c(a= 35, b = 3, c = 28)
# Las ecuaciones del modelo
Chen = function (t, y, parms) {
  with(as.list(y), {
    dX = -a * X+a*Y 
    dY = (c-a)*X+c*Y - X*Z
    dZ =X*Y - b*Z
    list(c(dX, dY, dZ)) })
}
#  condiciones iniciales
Eini = c(X = -3, Y = 2, Z = 20)
# la integración se realiza por 100 veces cada 0.01 vez
library(deSolve)
tiempos = seq(from = 0, to = 100, by = 0.001)
salida = ode(y = Eini, times = tiempos, func = Chen,
              parms = NULL)

# La gráfica del modelo
plot(salida,xlab="tiempo", col= "blue", lwd = 1)
plot(salida[,"X"], salida[,"Z"], col= "red", type = "l", xlab = "X",
     ylab = "Z", main = "Proyección plano XZ")
plot(salida[,"X"], salida[,"Y"], col= "magenta", type = "l", xlab = "X",
     ylab = "Y", main = "Proyección plano XY")
plot(salida[,"Y"], salida[,"Z"], col= "orange", type = "l", xlab = "Y",
     ylab = "Z", main = "Proyección plano YZ")
