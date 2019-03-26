#Juan Camilo Rivera
#21 Marzo
#Ejemplo de clasificacion 

#Librerias
library(ggplot2)
library(grid)
library(gridExtra)
library(rpart.plot)
library(caret)
library(C50)


rm(list = ls())
#Cargar los datos
data<-read.csv("titanic.csv",header=T,sep=",")
attach(data)
dim(data)
summary(data)

grid.newpage()
plotbyClass<-ggplot(data,aes(CLASS,fill=SURVIVED))+geom_bar() +labs(x="Clase", y="Pasajeros")+ guides(fill=guide_legend(title=""))+ scale_fill_manual(values=c("red","yellow"))+ggtitle("Sobrevivientes por Clase")
plotbyAge<-ggplot(data,aes(AGE,fill=SURVIVED))+geom_bar() +labs(x="Edad", y="Pasajeros")+ guides(fill=guide_legend(title=""))+ scale_fill_manual(values=c("red","yellow"))+ggtitle("Sobrevivientes por Edad")
plotbySex<-ggplot(data,aes(SEX,fill=SURVIVED))+geom_bar() +labs(x="Sexo", y="Pasajeros")+ guides(fill=guide_legend(title=""))+ scale_fill_manual(values=c("red","yellow"))+ggtitle("Sobrevivientes por Sexo")
grid.arrange(plotbyClass,plotbyAge,plotbySex,ncol=2)

tabla_SST <- table(SEX,SURVIVED)
prop.table(tabla_SST)



set.seed(666)
data_random <- data
y<-data_random[,4] #SURVIVED
X <- data_random[,1:3] #Resto de variables


trainX <- X[1:1467,]
trainy <- y[1:1467]
testX <- X[1468:2201,]
testy <- y[1468:2201]

model <- C50::C5.0(trainX, trainy,rules=TRUE )
summary(model)

model <- C50::C5.0(trainX, trainy)
plot(model)
plot(model, subtree = 7)




