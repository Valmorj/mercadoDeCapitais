#Instalando pacotes e e carregando
install.packages('ggplot2')
install.packages('ggthemes')
install.packages('scales')
install.packages('tseries')
install.packages('quantmod')
install.packages('dgof')
install.packages('qqnorm')
install.packages('ggthemes')
install.packages('zoo')
install.packages('xts')

library(tseries)
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

#Selecionando valores
tam <-length(vale)
pri <- vale [1]
ult <- vale[tam]

#Medidas de variabilidade
media <- mean(vale)
desvio <- sd(vale)

#Grafico do quantil
qqnorm(vale)

#Volatilidade
vol <- garch(vale)

#Teste Jarque Bera
jarque.bera.test(vol$resid[-1])

