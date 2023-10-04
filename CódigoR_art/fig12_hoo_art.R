# Figura 12
library(deSolve)
Hooke1 = function(t, x, parms) {
  Salida1=with(as.list(c(parms, x)),{
    dX = Y
    dY = -c^2*(X+2*b*X^3)
    list(c(dX, dY))
  })
  return(Salida1)  }
tiempos1 = seq(0,1.2, 0.01)
params = c(c = 1, b= -2)
Cini1 =c(X = 0.7, Y= 0.5)
## La función rk usa ode45 como un método por defecto
Solu1= rk(y = Cini1, times = tiempos1, func = Hooke1, parms = params)
# Se utiliza la funcion plot sobre el objeto solu1
plot(Solu1, xlab="tiempo",col="orangered",type="l")

# Se llama la funcion ode para construir la solucion
Solu2= ode(y = Cini1, times = tiempos1, func = hooke1, parms = params)
# Se utiliza la funcion plot sobre nuestro objeto solu2
plot(Solu2,xlab="tiempo", col="darkblue",type="l")