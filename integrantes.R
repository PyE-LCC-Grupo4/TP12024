install.packages("tidyverse")

library(readxl)
library(ggplot2)

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");

data = data.frame(
  integrantes = as.factor(df$`Cantidad Integrantes`)
)

ggplot(data, aes(x=integrantes)) +
  geom_bar(fill="#4dd0e1", color="black", width=.1) +
  xlab("Integrantes") +
  ylab("Viviendas") +
  labs(title = "Cantidad de integrantes por vivienda en barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

