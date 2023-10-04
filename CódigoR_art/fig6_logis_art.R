# figura 6
# install.packages("phaseR")
library(phaseR)
# Análisis cualitativo de la ecuación logística modificada
tiempos2=seq(from = 0, to = 5, by = 0.01)
param2 = c(a=1.5, L=6, K=14)
logis.mod = function(t,P,param){
  salida = with(as.list(c(P,param)),{
    dP=a*P*(P/L-1)*(1-P/K)
    list(c(dP))})
  return(salida)}

# El campo vectorial
logis.mod.flowField =
   flowField(logis.mod, xlim = c(0, 5), ylim = c(-1, 20),
               parameters = param2, points = 21,
               system = "one.dim", add = FALSE, xlab = "t", ylab = "P(t)")
grid()

# Las isoclinas nulas
logis.mod.nullclines =
  nullclines(logis.mod, xlim = c(0, 5), ylim = c(-1, 20),
             parameters = param2, system = "one.dim")

# Trayectorias con diversas condiciones iniciales
logis.mod.trajectory =
  trajectory(logis.mod, y0 = c(1.5, 2.5,7.5, 11.5,15, 18 ), tlim = c(0, 5),
               parameters = param2, system = "one.dim", col = rep("red", 6))

# Estabilidad de los puntos de equilibrio
logis.mod.Estab1=stability(logis.mod,ystar = c(0),parameters = param2,  system = "one.dim")
logis.mod.Estab2=stability(logis.mod,ystar = c(6),parameters = param2,  system = "one.dim")
logis.mod.Estab2=stability(logis.mod,ystar = c(14),parameters = param2,  system = "one.dim")