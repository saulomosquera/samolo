# figura 14
par(mfrow=c(1,2))
Hooke.num.sol=
numericalSolution(Hooke, y0 = c(0.3, 0.2), tlim=c(0,15),type = "one",
                  parameters = c(1, -2), col = c("red", "green"),
                  ylab = "X, Y", xlab = "tiempo", ylim = c(-0.5, 0.5))
legend("topright",legend=c("X", "Y"),col=c("red", "green"),
       lwd=c(2,2),
       bg="aliceblue")

Hooke.num.sol=
  numericalSolution(Hooke, y0 = c(0.7, 0.5), tlim=c(0,1.5),type = "one",
                    parameters = c(1, -2), col = c("red", "green"),
                    ylab = "X, Y", xlab = "tiempo", ylim = c(0, 10))
legend("topright",legend=c("X", "Y"),col=c("red", "green"),
       lwd=c(2,2),
       bg="aliceblue")

Hooke.Estabilidad1=stability(Hooke,ystar = c(0, 0),parameters = c(1, -2))
Hooke.Estabilidad2=stability(Hooke,ystar = c(1, 0),parameters = c(1, -2))
Hooke.Estabilidad3=stability(Hooke,ystar = c(-1,0),parameters = c(1, -2))