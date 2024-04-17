install.packages("tidyverse")

library(readxl)
library(ggplot2)

# URL
df = read_excel("C:\\Users\\USUARIO\\Downloads\\Datos_LP.xlsx", sheet = "FILTRO");

boxplot(df$`Tiempo de residencia en la vivienda actual (en años)`~df$`Calles asfaltadas`,
        main = strsplit(c("Calles asfaltadas por tiempo de residencia"), split = ";"),
        sub = "Fuente: Observatorio villero (2022)",
        xlab = "Calles afaltadas",
        ylab = "Tiempo de residencia en la vivienda actual (en años)",
        ylim = c(0,80),
        col = "#4dd0e1")