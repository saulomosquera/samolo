# Figura 7
library(deSolve)
#Definimos las condiciones iniciales
Cini = c(X=1, Y=0)
# Definimos los tiempos en los cuales queremos construir la solucion
tiempos = seq(from=0, to=8, by=.01)
# Definimos los valores de los parametros del modelo
params = c(c=1, b=2)
# Definimos la funcion que expresa nuestro sistema de ecuaciones
hooke1= function(t,y,parms){
  Salida = with(as.list(c(y,parms)),{
    dX = Y
    dY = -c^2*(X+2*b*X^3)
    list(c(dX,dY))
  })
  return(Salida)
}
# Se llama la funcion ode para construir la solucion
Salida= ode(y = Cini, times = tiempos, func = hooke1, parms = params)
# Se construye la gráfica de la solución
plot(Salida,xlab="tiempo", col="red",type="l")