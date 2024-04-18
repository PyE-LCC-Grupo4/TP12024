install.packages("tidyverse")

library(readxl)
library(ggplot2)

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");


data <- data.frame(
  x=df$`Tiempo de residencia en la vivienda actual (en años)`,
  y=df$Menores)

# Se eliminaron algunos datos atipicos, mencionarlos en el video

ggplot(data, aes(x=x, y=y)) +
  geom_point(fill="#ffe4b5") +
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
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
