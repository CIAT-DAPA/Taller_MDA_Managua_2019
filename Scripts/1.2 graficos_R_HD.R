
# Graficos en R
# Hugo Andres Dorado
# 27 08 2018

# Diagrama de dispersion

edad     <- c(21,34,10,15,37,58)
estatura <- c(1.8,1.7,1.5,1.4,1.7,1.6)

plot(edad,estatura,col = "red",pch=16,cex=2,
     main="Estatura vs edad",xlab = 'Edad (Años)',
     ylab = 'Estatura (mts)')

# cex: Tamaño de los puntos
# pch: Tipo de punto
# main,xlab,ylab: Etiquetas

# Graficos en el tiempo

dia <- 1:10

set.seed(123)
lempira <- runif(n = 10,min = 20,max = 25)
lempira

plot(dia,lempira,type="b",las=1)

# Histograma

set.seed(123)
rendimiento <- rnorm(1000,mean = 1700,sd=200)

hist(rendimiento,xlab = 'Rendimiento (No cajas/ha)',
     col='red')
box()


# Diagrama de barras

?mtcars

tabla <- with(mtcars,table(cyl,carb) )
tabla

barplot(tabla,
        main="Distribución de cilindros \ny carburadores",
        col=c("darkblue","red","green"),beside=T,
        legend = row.names(tabla),
        xlab = "Número de cilindros",
        ylab='Número de autos',ylim=c(0,8))

box()

tabla2 <- table(mtcars$cyl)

barplot(tabla2,xlab = "Número de cilindros",ylab='Número de autos',
        las=1)
box()

# Graficos boxplot

boxplot(mtcars$mpg,ylab="Millas/galon",col='forestgreen')

boxplot(mtcars$mpg~mtcars$am,ylab="Millas/galon",col='forestgreen',
        xlab='Transmisión')

text(1,30,"a")



