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
install.packages('KScorrect')

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
library(KScorrect)

#Carregando a a��o e plotando o gr�fico
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
dist <- rnorm(tam, media, desvio)
min <- min(vale)
max <- max(vale)

#Rentabilidade
##Rentabilidade no per�odo
rp <- (ult/pri) - 1
##Rentabilidade anual
ra <- (1 + rp)^(252/tam) - 1

#Teste Jarque Bera
jarque.bera.test(vale)

#Teste Kolmogorov-Smirnov(KS)
ks.test(vale, pnorm, mean(vale), sd(vale)) 
LcKS(vale, cdf = "pnorm")


