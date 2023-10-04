# Figura 1
install.packages("deSolve") # Carga el paquete
library(deSolve)  # carga de las librerias 
# La explicitación del modelo
# Los parámetros
params1=c(a=1.5,L=6, K=10) 
# Condiciones iniciales
cini1=c(3)
cini2=c(5) 
cini3=c(7)
cini4=c(9)
cini5=c(15)
cini6=c(20)
# Ecuaciones
# P es la variable de estado
Logis= function(t, P, parms) {
  Salida1=with(as.list(c(P, parms)),{
    dP=a*P*(P/L-1)*(1-P/K)
    list(c(dP))
  })
  return(Salida1)}
# La carga del modelo
# Tiempos
tiempos1=seq(0,2,0.1)
# La integración utiliza la función ode.
sol1=ode(y=cini1, t=tiempos1, func=Logis, parms=params1)
sol2=ode(y=cini2, t=tiempos1, func=Logis, parms=params1)
sol3=ode(y=cini3, t=tiempos1, func=Logis, parms=params1)
sol4=ode(y=cini4, t=tiempos1, func=Logis, parms=params1)
sol5=ode(y=cini5, t=tiempos1, func=Logis, parms=params1)
sol6=ode(y=cini6, t=tiempos1, func=Logis, parms=params1)
# La representación
head(sol1, n=10)
plot(sol1,sol2,sol3, sol4,sol5, sol6, lwd=2,
     xlab="t", ylab="P(t)", col=c("red", "green", "blue", "deeppink3", "brown4", "orange"),
     main=  "Crecimiento Logístico modificado")
legend("topright",legend=c("P(0)=3", "P(0)=5",  "P(0)=7","P(0)=9","P(0)=15","P(0)=20"),col=c("red", 
"green","blue", "deeppink3", "brown4", "orange"),lwd=c(2,2), bg="aliceblue")

