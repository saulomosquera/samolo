# Figura 11
library(deSolve)
Hooke2 = function(t, x, parms) {
  Salida1=with(as.list(c(parms, x)),{
    dX = Y
    dY = -c^2*(X+2*b*X^3)
    list(c(dX, dY))
  })
  return(Salida1)  }
tiempos2 = seq(0,20, 0.01)
params = c(c = 1, b= -2)
Cini2 =c(X = 0.3, Y= 0.2)
# La función rk usa ode45 como un método por defecto
Solucion= rk(y = Cini2, times = tiempos2, func = Hooke2, parms = params)
plot(Solucion, xlab="tiempo",col="red",type="l")