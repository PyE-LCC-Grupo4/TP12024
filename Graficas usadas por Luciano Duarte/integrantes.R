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
integrantes = as.factor(df$`Cantidad Integrantes`)

newTable <- table(integrantes)
barplot(newTable,
        cex.axis = par("cex.axis"),
        cex.names = par("cex.axis"),
        col = "#4dd0e1", 
        ylab = "Integrantes", 
        xlab = "Hogares",
        xlim = c(0, 12),
        sub= "Fuente: Observatorio villero (2022)",
        ylim = c(0, 250))
mtext("Cantidad de integrantes por hogar", side=3, cex=2)
