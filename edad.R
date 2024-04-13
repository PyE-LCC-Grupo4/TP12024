install.packages("tidyverse")

library(readxl)
library(ggplot2)

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");

data=data.frame(value=df$`Edad jefe/a del hogar`)

# Histograma
ggplot(data, aes(value)) + 
  geom_histogram(binwidth = 8, fill="#4dd0e1", color="black") +
  scale_x_continuous(name="Edad", expand = c(0, 0), breaks=seq(20,92,8)) +
  labs(title = "Edad del jefe de la casa en viviendas de barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(name="Hogares", expand=c(0,0), limits = c(0,300), breaks=seq(0,300,50))
