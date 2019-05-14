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
dist <- rnorm(tam, media, desvio)
min <- min(vale)
max <- max(vale)

#Retorno
##Retono diário
diario <- dailyReturn(vale)
plot(diario)