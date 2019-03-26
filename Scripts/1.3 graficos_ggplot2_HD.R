
# Graficos en R
# Hugo Andres Dorado
# 20/03/2019


library(ggplot2)

basetrigo <- read.csv("baseTrigo.csv",sep = ",")

basetrigo 

summary(basetrigo)

head(basetrigo,4)

str(basetrigo)

sd(basetrigo$Rend) # Calcular desviacion estandar

apply(basetrigo[,4:5],2,sd)

# Graficos

ggplot(basetrigo,aes(y=Rend,x=Variedad))+geom_boxplot()+
  facet_grid(.~ubicacion)

ggplot(basetrigo,aes(x=Rend))+geom_histogram(bins=20,
                                             colour = 'green',
                                             fill= 'yellow')+
  facet_grid(Variedad~ubicacion)+ylab('Conteo')+
  xlab('Rendimiento')+theme_bw()
  

ggplot(basetrigo,aes(x=tiemp,y=Rend))+
  geom_point(aes(colour=Variedad))+
  geom_smooth(aes(colour=Variedad))+
  facet_grid(.~ubicacion)


summary(iris)

ggplot(iris,aes(x=Sepal.Length,y=Petal.Length))+
  geom_point(aes(colour=Species,size = Petal.Width),
             alpha=0.7)


