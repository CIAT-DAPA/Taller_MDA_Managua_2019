
# Curso R Primera 
# Hugo Andres Dorado
# 20-Marzo-2019

123

n <- 5 # Agregar valor a un objeto llamado n
n

m

# Leer base de datos 

basetrigo <- read.csv("baseTrigo.csv",sep = ",")

getwd() # Verificar espacio de trabajo en R

setwd() # Mover espacio de trabajo

# Histograma

hist(basetrigo$Rend,xlab = "Rendimiento kg/ha",
     main = "Rendimiento en trigo", col = 'red' )

box()
abline(v=mean(basetrigo$Rend),lty=2,col='blue')

?hist # Ayuda en R

# Crear vectores en R

edad <- c(24,31,15,18,11)

edad[3]
edad[c(1,5)]
is(edad)

sexo <- c("M","M","F","M","F")
sexo
is(sexo)

id <- 1:5
id

# Crear data.frame

is(basetrigo)

df <- data.frame(id,sexo,edad)

df[3,]

df[3:5,]

df[1,3]

df$peso <- c(56,60,70,15,16)

(df$edad + df$peso)/2

write.csv(df,'estudiantes.csv',row.names = F)

# Crear Lista

ls_nueva <- list(df,basetrigo)

ls_nueva[[1]]

# Formato fechas

fechas <- c("20/3/2019","21/3/2019")
is(fechas)

fechas2 <- as.Date(fechas,"%d/%m/%Y")
is(fechas2)
