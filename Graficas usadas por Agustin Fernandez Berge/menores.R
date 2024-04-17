install.packages("tidyverse")

library(readxl)
library(ggplot2)

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");

data = data.frame(
  integrantes = as.factor(df$Menores)
)

ggplot(data, aes(x=integrantes)) +
  geom_bar(fill="#142433", color="black", width=.1) +
  xlab("Menores") +
  ylab("Viviendas") +
  labs(title = "Cantidad de menores por vivienda en barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

summary(df$Menores)
IQR(df$Menores)
median(df$Menores)
