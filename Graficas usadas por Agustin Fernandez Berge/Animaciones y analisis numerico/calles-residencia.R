install.packages("tidyverse")
install.packages("gganimate")

library(readxl)
library(ggplot2)
library(tidyverse)
library(gganimate)
library(forcats)
library(dplyr)

source("theme.R")

# URL
df = read_excel("../Datos_LP.xlsx", sheet = "FILTRO");

data <- data.frame(
  name=df$`Calles asfaltadas`,
  value=df$`Tiempo de residencia en la vivienda actual (en años)`
)

summary(df$`Tiempo de residencia en la vivienda actual (en años)`)

ggplot(data, aes(x=name, y=value)) +
  geom_boxplot(fill="#2a3990", colour = "White") +
  xlab("Calles asfaltadas") +
  ylab("Tiempo de residencia en la vivienda actual (en años)") +
  ylim(c(0,80)) +
  labs(title = "Calles asfaltadas por tiempo de residencia en barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  tema
