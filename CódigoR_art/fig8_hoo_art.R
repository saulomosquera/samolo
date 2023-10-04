# Figura 6
par(mfrow=c(1,1))
# Posicion X contra t\\
plot(Salida[,"time"],Salida[,"X"],
     ylim=c(-2, max(Salida[ ,"X"], 3)),
     type="l",
     col="red",
     lwd=2,
     xlab="Tiempo",
     ylab="",
     main="Modelo de Hooke generalizado")
grid()
#  velocidad Y contra t\\
lines(Salida[,"time"], Salida[,"Y"], 
      type="l", 
      col="blue", 
      lwd=2)
legend("topright",
       legend=c("Desplazamiento", "Velocidad"),
       col=c("red", "blue"),
       lwd=c(2,2),
       bg="snow1")

