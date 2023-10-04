# Figura 9
library(phaseR)
Hooke=function(t, y, param){
  # Variables
  x =y[1]
  y =y[2]
  # Parámetros
  c =param[1]
  b =param[2]
  # Ecuaciones diferenciales
  dy =numeric(2)
  dy[1]=y
  dy[2]= -c^2*(x+2*b*x^3)
  list(dy)}
# Campo vectorial
Hooke.flowField=
  flowField(Hooke, xlim = c(-3, 5), ylim = c(-12, 12.5),
            param = c(1, 2), points = 19, add = FALSE)
# Isoclinas nulas
Hooke.nullclines =
  nullclines(Hooke, xlim = c(-5, 5), ylim = c(-12, 12.5),
             param = c(1, 2), points = 500)
Cini = matrix(c(1, 2, 1.5, 2, 2.5, 2, 3,5), ncol = 2, nrow = 4, byrow = TRUE)
# Curvas solución
Hooke.trajectory =
  trajectory(Hooke, y0 = Cini, tlim= c(0,10),
             param = c(1, 2), col = rep("red", 4))