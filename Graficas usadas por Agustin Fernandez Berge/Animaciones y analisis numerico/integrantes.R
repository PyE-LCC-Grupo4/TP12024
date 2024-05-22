install.packages("tidyverse")
install.packages("gganimate")

library(readxl)
library(ggplot2)
library(tidyverse)
library(gganimate)

source("theme.R")

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");

i=0
data_zero = data.frame(integrantes = as.factor(c(1,2,3,4,5,6,7,8,9,10)),i)
i=1
data = data.frame(
  integrantes = as.factor(df$`Cantidad Integrantes`),i
)

summary(data)
quantile(df$`Cantidad Integrantes`, c(.125, .875))

data = rbind(data_zero,data)

integrantes_animado = ggplot(data, aes(x=integrantes)) +
  geom_bar(fill="white", color="#2a3990", width=.1) +
  xlab("Integrantes") +
  ylab("Viviendas") +
  labs(title = "Cantidad de integrantes por vivienda en barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  tema +
  transition_states(i, wrap=FALSE)

anim = animate(integrantes_animado, duration = 3, renderer = gifski_renderer())
anim
anim_save("output.gif", anim)

print(paste("Mediana:",median(df$`Cantidad Integrantes`)));
print(paste("Rango intercuartilico:",IQR(df$`Cantidad Integrantes`)))
