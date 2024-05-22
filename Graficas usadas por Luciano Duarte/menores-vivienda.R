install.packages("readxl")
# Alternatively, install just ggplot2:
install.packages("tidyverse")

library(readxl)
library(ggplot2)

# URL
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");
summary(df);
# N = 4;

plot(df$`Tiempo de residencia en la vivienda actual (en años)`, df$`Menores`,
     main = strsplit(c("Tiempo en la residencia (año) por cantidad de menores \n en barrios populares"), split = ";"),
     xlab = "Tiempo de residencia en la vivienda actual (en años)",
     pch = 19,
     ylab = "Menores en la residencia",
     ylim = c(0,10),
     xlim = c(0, 60),
     xaxp = c(0, 60, 6),
     sub= "Fuente: Observatorio villero (2022)")

