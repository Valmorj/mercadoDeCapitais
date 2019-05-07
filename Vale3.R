#Instalando pacotes e e carregando
install.packages('ggplot2')
install.packages('ggthemes')
install.packages('scales')
install.packages('tseries')
install.packages('graphicsQC')
install.packages('quantmod')
install.packages('dgof')
install.packages('ggthemes')
install.packages('zoo')

library(tseries)
library(graphics)
library(dgof)
library(qqnorm)
library(quantmod)
library(ggplot2)
library(scales)
library(ggthemes)
library(zoo)
library(xts)

#Carregando a ação e plotando o gráfico
env = new.env()
getSymbols("VALE3.SA",src="yahoo", 
env=env,
from=as.Date('2018-01-02'))
vale = env$VALE3.SA[,4]

autoplot(vale)

datavale <- data.frame(vale)

#Selecionando valores
tam <-length(vale)
pri <- datavale [1,1]
ult <- datavale [tam,1]

#Medidas de variabilidade
media <- mean(vale)
desvio <- sd(vale)

#Rentabilidade
##Rentabilidade no período
rp <- (ult/pri) - 1
##Rentabilidade anual
ra <- (1 + rp)^(252/329) - 1

#Teste Jarque Bera
jarque.bera.test(vale)

#

