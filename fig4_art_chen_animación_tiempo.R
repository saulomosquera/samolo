# Figura 4, creada con ggplot y la animación de la evolución de X, Y y Z contra t.
# El Sistema de Chen
# Valores de los parámetros 
library(deSolve)
library(gganimate)
library(cowplot)
library(patchwork) # crea gráfcos juntos o uno debajo de otro
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
tiempos = seq(from = 0, to = 100, by = 0.01)
salida = ode(y = Eini, times = tiempos, func = Chen,
              parms = NULL)
head(salida, n = 4)

# La gráfica del modelo con ggplot
theme_set(theme_bw())
curva=data.frame(salida)
head(curva, n = 4)
# traza el gráfico estático

graf1=ggplot(curva,aes(x=tiempos, y=X)) +
  geom_line( linetype=1.5, size=1,color=c("magenta3")) +
  theme( panel.border = element_rect(colour = "black", size=0.5,
                                     fill=NA))+
  labs(x = "t" ,y = "X",  col = "")+ggtitle("Promedio de la velocidad 
hidrodinamica contra el tiempo")
graf1

graf2=ggplot(curva,aes(x=tiempos, y=Z)) +
  geom_line( linetype=1.5, size=1,color=c("blue")) +
  theme( panel.border = element_rect(colour = "black", size=0.5,
                                     fill=NA))+
  labs(x = "t" ,y = "Z",  col = "")+ggtitle("Gradiente de la temperatura 
contra el tiempo")
graf2

graf3=ggplot(curva,aes(x=tiempos, y=Y)) +
  geom_line( linetype=1.5, size=1,color=c("green")) +
  theme( panel.border = element_rect(colour = "black", size=0.5,
                                     fill=NA))+
  labs(x = "t" ,y = "Y",  col = "")+ggtitle("Diferencia de temperatura 
contra el tiempo")
graf3

# Los tres gráficos estáticos en uno solo

graf1 + graf2 + graf3

# traza el gráfico dinámico de X contra t
ani1=graf1 +
  transition_reveal(tiempos)+labs(title = "t= {frame_along},  Promedio espacial de la velocidad hidrodinámica 
                                  contra el tiempo")
ani1

# traza el gráfico dinámico de Y contra t
ani2=graf2 +
  transition_reveal(tiempos)+labs(title = "t= {frame_along},  Gradiente de la temperatura 
contra el tiempo")
ani2

# traza el gráfico dinámico de Z contra t
ani3=graf3 +
  transition_reveal(tiempos)+labs(title = "t= {frame_along},  Diferencia de temperatura 
contra el tiempo")
ani3

