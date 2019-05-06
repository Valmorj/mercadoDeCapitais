#Instalando pacotes e e carregando
install.packages('ggplot2')
install.packages('ggthemes')
install.packages('scales')
install.packages('tseries')
install.packages('graphics')
install.packages('quantmod')
install.packages('dgof')
install.packages('qqnorm')
install.packages('ggthemes')

library(tseries)
library(graphics)
library(dgof)
library(qqnorm)
library(quantmod)
library(ggplot2)
library(scales)
library(ggthemes)

#Carregando a ação e plotando o gráfico
env = new.env()
getSymbols("VALE3.SA",src="yahoo", 
env=env,
from=as.Date('2018-01-14'))
vale = env$VALE3.SA[,4]

autoplot(vale)

#Medidas de variabilidade
media <- mean(vale)
desvio <- sd(vale)

#Normal
tamanho <- seq(media-4*desvio, media+4*desvio, 0.01)
nor <- dnorm(tamanho, media, desvio)
plot (tamanho, nor, main = , type = 'l', ylim = c(0,max(nor)+0.01), axes = FALSE)
axis (4, at = seq(media - 3*desvio, media + 3*desvio, desvio))

#Grafico do quantil
qqnorm(vale)

#Volatilidade
vol <- garch(vale)

#Teste Jarque Bera
jarque.bera.test(vol$resid[-1])

