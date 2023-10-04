# figura 2
# install.packages("deSolve")
library(deSolve)
# Solución de la ecuación logística
tiempos2=seq(from = 0, to = 3, by = 0.01)
param2 = c(a=1.5, L=6, K=14)
logis = function(t,y,param){
  salida = with(as.list(c(y,param)),{
    dP=a*P*(P/L-1)*(1-P/K)
    list(c(dP))})
  return(salida)}

oncecur=seq(0,20,2)

listadatos=lapply(oncecur,function(i){ode(y=c(P=i), times=tiempos2,func=logis,parms = param2)})

curvas= rbind(listadatos[[1]],listadatos[[2]],listadatos[[3]],
             listadatos[[4]],listadatos[[5]],listadatos[[6]],
             listadatos[[7]],listadatos[[8]],listadatos[[9]],
             listadatos[[10]],listadatos[[11]])

curvas2=data.frame(curvas)
curvas2$group=c(rep("P(0)=0",301),rep("P(0)=2",301),
                rep("P(0)=4",301),rep("P(0)=6",301),rep("P(0)=8",301),
                rep("P(0)=10",301),rep("P(0)=12",301),rep("P(0)=14",301),
                rep("P(0)=16",301),rep("P(0)=18",301),rep("P(0)=20",301))
curvas2

logis2=curvas2
# Modificar los datos
data_label = logis2                             
data_label$label = NA
data_label$label[which(data_label$time == min(data_label$time))] <- data_label$group[which(data_label$time == min(data_label$time))]

install.packages("ggplot2")
require(ggplot2)

colcur = c("red","#999999","#E69F00", "red",
          "deeppink4", "green",
          "#000000",
          "red", "#0072B2","#009E73" , "#CC79A7")

install.packages("ggrepel")
require(ggrepel)


# ggplot2 traza el gráfico con etiquetas
ggplot(data_label, aes(time, P, group = forcats::fct_inorder(group))) +    
  geom_line(aes(colour= forcats::fct_inorder(group)),size=0.8) +
  scale_colour_manual(values=cbp2)+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        panel.border = element_rect(colour = "black", size=0.5,
                                        fill=NA))+
  geom_label_repel(aes(label = label,color=group),
                   nudge_x = -0.15,
                   size=2,
                   label.size=NA,
                   fill="honeydew2",
                   na.rm = TRUE,segment.color=NA) +
  theme(legend.position = "none") +
  labs(x = "t", y="P(t)") 