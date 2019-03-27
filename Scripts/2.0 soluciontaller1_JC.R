#Juan Camilo Rivera
#21 Marzo del 2019
#Solucion del taller 1



#Librerias
library(ggplot2)

#2.
datos_mora <- read.csv("mora_toyset.csv", header = T)
head(datos_mora)

#Tipo de clase, utilizamos la funcion class
class(datos_mora)
is.data.frame(datos_mora)

#Acceder a una columna data.frame es con el simbolo $
datos_mora
  
#Cuantas variables tenemos
str(datos_mora)  
dim(datos_mora)  
  
#Cambiar de numerico a categorico
datos_mora$Nar <- as.factor(datos_mora$Nar)
str(datos_mora)
datos_mora$Cal <- as.factor(datos_mora$Cal)
str(datos_mora)

#Promedio de la variable Yield

promedio_yield <- mean (datos_mora$Yield)
promedio_yield

#Maximo de la variable Yield
maximo_yield <- max(datos_mora$Yield)

#Minimo de la variable Yield
minimo_yield <- min(datos_mora$Yield)

#Varianza de la variable Yield
varianza_yield <- var(datos_mora$Yield)

#Desviacion Estandar
desviacionstandar_yield <- sd(datos_mora$Yield)


#Histogramas usando ggplot
ggplot(datos_mora, aes(x=Yield_2, fill= Region))+geom_histogram(alpha=0.5)

#La función summary
summary(datos_mora)

