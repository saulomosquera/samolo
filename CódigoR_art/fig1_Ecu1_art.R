library(deSolve)
Ecu1= function( t, x, params){
  dx = x^2+x*t
  list(dx)
}
Cini= 0.1
tiempos =seq(from = 0, to = 1, by = 0.01)
solu=ode( y= Cini, times = tiempos, func = Ecu1, parms = NULL)
head(solu, n = 4)
plot(solu, main = " ", lwd = 2,xlab="t",
     ylab="x(t)", col=c("magenta3"))