install.packages("tidyverse")
install.packages("gganimate")

library(readxl)
library(ggplot2)
library(tidyverse)
library(gganimate)

source("theme.R")

# Leo el xlsx
df = read_excel("../Datos_LP.xlsx", sheet = "FILTRO");

i=0
data_zero = data.frame(integrantes = as.factor(c(0,1,2,3,4,5,6,7,9)),i)
i=1
data = data.frame(
  integrantes = as.factor(df$Menores),i
)

data= rbind(data_zero, data)

menores_animado = ggplot(data, aes(x=integrantes)) +
  geom_bar(fill="white", color="#2a3990", width=.1) +
  xlab("Menores") +
  ylab("Viviendas") +
  labs(title = "Cantidad de menores por vivienda en barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  tema +
  transition_states(i, wrap=FALSE)

anim = animate(menores_animado, duration = 3, renderer = gifski_renderer())
anim
anim_save("output.gif", anim)

summary(df$Menores)
quantile(df$Menores, c(.125, .875))
