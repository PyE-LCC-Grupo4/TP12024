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
data_zero = data.frame(value = rep(38, 1),i)
i=1
data=data.frame(value=df$`Edad jefe/a del hogar`,i)
summary(data)
quantile(df$`Edad jefe/a del hogar`, c(.125, .875))
 data = rbind(data_zero,data)

# Histograma
edad_animada = ggplot(data, aes(value)) + 
  geom_histogram(binwidth = 8, fill="white", colour="#2a3990") +
  scale_x_continuous(name="Edad", expand = c(0, 0), breaks=seq(20,92,8)) +
  labs(title = "Edad del jefe de la casa en viviendas de barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  scale_y_continuous(name="Hogares", expand=c(0,0), limits = c(0,300), breaks=seq(0,300,50)) +
  tema + # Importado desde theme.R
  transition_states(i, wrap=FALSE)
  
anim = animate(edad_animada, duration = 3, renderer = gifski_renderer())
anim
anim_save("output.gif", anim)
