install.packages("tidyverse")
install.packages("gganimate")

library(readxl)
library(ggplot2)
library(tidyverse)
library(gganimate)

source("theme.R")

# Leo el xlsx
df = read_excel("../Datos_LP.xlsx", sheet = "FILTRO");

data <- data.frame(
  x=df$`Tiempo de residencia en la vivienda actual (en años)`,
  y=df$Menores)

summary(data)

# Se eliminaron algunos datos atipicos, mencionarlos en el video

ggplot(data, aes(x=x, y=y)) +
  geom_point(fill="white", color="white") +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  xlim(0,60) +
  scale_y_continuous(breaks=seq(0,10,1)) +
  labs(title = "Cantidad de menores de 18 años por tiempo de residencia",
       caption = "Fuente: Observatorio villero (2022)") +
  xlab("Tiempo de residencia en la vivienda actual(en años)") +
  ylab("Cantidad de menores de 18 años") +
  tema
