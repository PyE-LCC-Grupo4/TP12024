install.packages("tidyverse")

library(readxl)
library(ggplot2)

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");

totalIntegrantes = sum(df$`Cantidad Integrantes`);
totalVarones = sum(df$`total`)
totalMenores = sum(df$Menores);

porcentajes = round(c(totalMenores, totalIntegrantes-totalMenores)/totalIntegrantes * 100,2);

pie(porcentajes , labels = c(
  paste("Menores de 18 años","(",porcentajes[1],"%)",sep=""),
  paste("Mayores de 18 años","(",porcentajes[2],"%)",sep="")),
  cex = 1,
  edges = 200,
  radius = 0.8,
  clockwise = T,
  init.angle = 90,
  density = NULL,
  sub= "Fuente: Observatorio villero (2022)",
  angle = 45,
  col = c("#01bee6", "#ff4457"), border = NULL,
  lty = NULL, main = NULL
)
mtext("Porcentaje de personas menores y mayores de 18 años", side=3, cex=1.5)