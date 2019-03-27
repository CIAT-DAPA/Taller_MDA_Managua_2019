library(agricolae)

#disenno diseno completo al azar
rep<- 3
trt<-1:4
dca1 <- design.crd(trt, r=rep,seed=33, serie=0)

dca1
dca1$book

#disenno diseno completo al azar
#trt<-1:5
bca1 <- design.rcbd(trt,r=4, seed=-513, serie=0)

bca1
bca1$book
bca1$sketch


#disenno de cuadrado latino
trt<-1:4
dcl1 <- design.lsd(trt, seed=543, serie=0)

dcl1$book
dcl1$sketch

#disenno de greco latino
#dos tratamientos que no tienen interaccion
trt1 <- c("A", "B", "C", "D")
trt2 <- 1:4
dcgl1 <- design.graeco(trt1,trt2, seed=543, serie=0)

dcgl1$book
dcgl1$sketch

#split-plot disenno de experimento
trt1<-c("A","B","C","D")
trt2<-1:2

dsp1 <-design.split(trt1,trt2,r=3, serie=0, seed=543)

dsp1$book
dsp1$sketch

#strip-plot disenno de experimento

trt1<-c("A","B","C","D")
trt2<-c("a","b","c")
d_sp1 <-design.strip(trt1,trt2,r=3,serie=0,seed=543)

d_sp1$book


#disenno factoriales
#numero de niveles de cada factor
trt <- c (3,2)
d_factorial <-design.ab(trt, r=3, serie=0, design = "crd") #diseno en completo al azar
d_factorial <-design.ab(trt, r=3, serie=0, design = "rcbd") #disenno bloques
d_factorial <-design.ab(trt, serie=0, design = "lsd") #disenno en cuadrado 

d_factorial$book

#disenno de latice
#aca reporducimos el latice de Sergio
#Se requiere un número de tratamientos de un cuadrado perfecto, 
#por ejemplo 9, 16, 25, 36, 49
#Puede generar un latice simple (2 rep.) o latice triple (3 rep.)
#r puede ser 2 o 3

trt<- 1:36
lat1<- design.lattice(trt, r=3, serie = 0, kinds = "Super-Duper",randomization=TRUE)
lat1$book
lat1$sketch





