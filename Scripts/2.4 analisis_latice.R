library(agricolae)
#library(dplyr) #este usamos para manipular
latice<-Latice

biofor <- read_excel("D:/ToBackup/Humidtropics Soils/ICDF arroz reportes y convenios/Datos ICDF/Ensayo biofortif_ejemplo.xlsx")

mod<-aov(rend~Rep+Genotipo, data=biofor) 
summary(mod)

LSD.test(mod, "Genotipo", group=T, console = T) #Diferencia minima
duncan.test(mod, "Genotipo", console = T)  #Duncan
me1<-HSD.test(mod, "Genotipo", console=T) #Tukey

me2<-me1$groups
me2$trt<-row.names(me2)

library(ggplot2)
library(forcats)


biofor %>% 
  mutate(Genotipo=as.factor(Genotipo)) %>% 
  ggplot(aes(x=as.factor(Genotipo), y=rend))+
  #geom_point()+
  #geom_boxplot(alpha=0.1)+
  stat_summary(fun.y="mean", geom="bar", fill="black")+
  stat_summary(fun.data=mean_se, geom="errorbar", color="red")

biofor %>% 
  mutate(Genotipo=as.factor(Genotipo)) %>% 
  ggplot(aes(x=fct_reorder(Genotipo, rend), y=rend))+
  geom_point()+
  geom_boxplot(alpha=0.2)+
  stat_summary(fun.y="mean", geom="bar", color="blue")+
  stat_summary(fun.data=mean_se, geom="errorbar", color="red")+
  geom_text(data=me2,aes(x=trt, y=rend+300,label=groups),vjust=0)


latice %>% 
  ggplot(aes(x=DENOMINACION))+facet_grid(~AMB)+geom_bar()


latice3<-latice %>% 
  filter(AMB==3)

attach(latice3)
modelLat3<-PBIB.test(BIN,DENOMINACION,REP,REN,k=6,console=TRUE)
modelLat3

modelLat3$



media<- modelLat3$means
grupo<-modelLat3$groups
grupo$DENOMINACION<-row.names(grupo)

grupo %>% 
  ggplot(aes(x=fct_reorder(DENOMINACION, REN.adj), y=REN.adj))+geom_col()+coord_flip()+
  geom_text(aes(x=DENOMINACION, y=REN.adj+200,label=groups),vjust=0)





library(cowplot)
latice %>% 
  ggplot(aes(x=DENOMINACION, y=REN))+geom_point()+ coord_flip()+
  stat_summary(fun.y="mean", geom="point", color="blue")+
  stat_summary(fun.data=mean_se, geom="errorbar", color="red")+
  facet_grid(~AMB)


attach(latice)

modelo<- AMMI(AMB, DENOMINACION, REP, REN, console=T)

index<-index.AMMI(modelo)
# Crops with improved stability according AMMI.
print(index[order(index[,3]),])
plot(modelo)


#ASV=AMMI Stability Value
#YSI= Yield Stability Index
#ASV=AMMI stability value
#YSI=Yield stability index
#rASV=Rank of AMMI stability value
#rYSI=Rank of yield stability index
#means=average genotype by environment



