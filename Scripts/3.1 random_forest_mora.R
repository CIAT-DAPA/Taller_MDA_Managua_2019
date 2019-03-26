
#Ejercicion Redes Neuronales en R
#Hugo Andres Dorado B.
#30 Mayo 2017


#install.packages("caret")
#install.packages("nnet")

rm(list=ls())

library(caret)
library(nnet)
library(randomForest)

datos_mora <- read.csv("mora_toyset.csv",row.names = 1)

datos_mora <- datos_mora[,-c(30,31)]

#Particion

set.seed(123)

runif(1)

inTrain  <- createDataPartition(y=datos_mora$Yield, p=0.7, list=F)

training <- datos_mora[inTrain,]

testing  <- datos_mora[-inTrain,]

#Normalizacion

# norm_training <- preProcess(training,method = "range")

# training_norm <- predict(norm_training,training)

# testing_norm  <- predict(norm_training,testing)

# Entrenamiento del modelo

model <- train(Yield~.,data=training,method = "rf",
                trControl = trainControl(method = "cv",number = 5),
               importance=T)


model

#Desempenio del modelo

pred_val <- predict(model,testing)

postResample(pred_val,testing$Yield)

plot(pred_val,testing$Yield,col="red",pch=19)

abline(0,1,lty=2)

#Relevancia de variables

varImp <- varImp(model)

plot(varImp)

partialPlot(model$finalModel,datos_mora,srtm,
            ylab='Rendimiento')








