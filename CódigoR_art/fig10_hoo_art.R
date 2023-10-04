# Figura 10
Hooke.num.sol=
  numericalSolution(Hooke, y0 = c(1, 2), tlim=c(0,10), type = "one",
                    parameters = c(1, 2), col = c("red", "green"),
                    ylab = "X, Y", ylim = c(-3, 3))
legend("topright",legend=c("X",  "Y"),col=c("red", "green"),
       lwd=c(2,2), bg="aliceblue")

Hooke.estabilidad.d=stability(Hooke,ystar = c(0,0),parameters = c(1,2))