#Librerias
library(ggplot2)
library(grid)
library(gridExtra)
library(rpart.plot)
library(caret)


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
prop.table(tabla_SST, margin = 1)
tabla_SCT <- table(CLASS,SURVIVED)
prop.table(tabla_SCT,1)
tabla_SAT <- table(AGE,SURVIVED)
prop.table(tabla_SAT, margin = 1) 
table(data) 

#par(mfrow=c(2,2))
plot(tabla_SCT, col = c("red","yellow"), main = "Sobreviviente vs. Clase")
plot(tabla_SAT, col = c("red","yellow"), main = "Sobreviviente vs. Edad")
plot(tabla_SST, col = c("red","yellow"), main = "Sobreviviente vs. Sexo")

head(data,10)
tail(data,10)

data_random <- data

set.seed(666)
set.seed(666)
y<-data_random[,4] #SURVIVED
X <- data_random[,1:3] #Resto de variables


trainX <- X[1:1467,]
trainy <- y[1:1467]
testX <- X[1468:2201,]
testy <- y[1468:2201]

#Opcion 2

set.seed(666)
indexes = sample(1:nrow(data), size=floor((2/3)*nrow(data)))
trainX<-X[indexes,]
trainy<-y[indexes]
testX<-X[-indexes,]
testy<-y[-indexes]


model <- C50::C5.0(trainX, trainy,rules=TRUE )


summary(model)
model <- C50::C5.0(trainX, trainy)
plot(model) 

datos_rpart_test <- testX
datos_rpart_test$SOBREVIVE <- testy
datos_rpart_train <- trainX
datos_rpart_train$SOBREVIVE <- trainy
modelo_rpart <- rpart::rpart(SOBREVIVE ~., data = datos_rpart_train)
rpart.plot(modelo_rpart)



#random Forest
rf_fit <- train(SOBREVIVE ~ ., 
                data = datos_rpart, 
                method = "ranger")

# predict the outcome on a test set
rf_pred <- predict(rf_fit, datos_rpart_test)
# compare predicted outcome and true outcome
confusionMatrix(rf_pred, as.factor(datos_rpart_test$SOBREVIVE))





