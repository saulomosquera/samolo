# Figura 13
library(phaseR)
Hooke=function(t, y, parameters){
  #variables
  x =y[1]
  y =y[2]
  # parametros
  c =parameters[1]
  b =parameters[2]
  # definimos las ecuaciones diferenciales
  dy =numeric(2)
  dy[1]=y
  dy[2]= -c^2*(x+2*b*x^3)
  list(dy)}
Hooke.flowField=
  flowField(Hooke, xlim = c(-2, 2), ylim = c(-2, 2),
            parameters = c(1, -2), points = 21, add = FALSE)
Hooke.nullclines=
  nullclines(Hooke, xlim = c(-2, 2), ylim = c(-2, 2),
             parameters = c(1, -2), points = 500)
Cini=matrix(c(0.1,0, 0.3,0, 0.2,0.1, 0.3, 0.2, -0.2, -0.3,0.2, 0.3,-1,1,
              1,-1,-0.8,0.8,0.8,-0.8, -1,1.5,1,-1.5,-1.5,1.5,1.5,-1.5), 
            ncol = 2, nrow = 14, byrow = TRUE)
Hooke.trajectory =
  trajectory(Hooke, y0 = Cini, tlim= c(0,10),
             parameters = c(1, -2), col = rep("mediumvioletred", 6))