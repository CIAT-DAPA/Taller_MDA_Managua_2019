#Script para la presentación primer dia.


data("iris")
datos_iris <- iris

names(datos_iris)
summary (datos_iris)

#
#Mediana 
x <- c(3,1,5,6,7,9,10)
mediana <- median(x)
mediana

#Mediana muestra par
y <- c(20,2,6,12)
mediana <-  median(y)

#Promedio
promedio_x <- mean(x)
promedio_y <- mean(y)

#Moda
z <- c(1,2,2,2,3,3,3,1,12,4)

moda <- function(x) {
  t <- table(x)
  return(as.numeric(names(t)[t == max(t)]))
  
}

moda_z <- moda(z)
moda_z

#Cuantiles
cuantiles <- quantile(datos_iris$Sepal.Length)
cuantiles

