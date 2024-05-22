install.packages("readxl")
# Alternatively, install just ggplot2:
install.packages("tidyverse")

library(readxl)
library(ggplot2)

# URL
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");
summary(df);
# N = 4;

#Variables de la seccion 1

# Grafico cantidad de integrantes
data=data.frame(value=df$`Edad jefe/a del hogar`)
boxplot(data,
        main = strsplit(c("Edad del jefe de la casa por hogares en barrios populares"), split = ";"),
        xlab = "Edad",
        ylim = c(15, 90),
        col = "#4dd0e1",
        horizontal = TRUE,
        sub= "Fuente: Observatorio villero (2022)",
        xaxp = c(10, 90, 8))
