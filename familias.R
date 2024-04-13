install.packages("tidyverse")

library(readxl)
library(ggplot2)

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");

cantFamilias = as.factor(df$`Cantidad Familias`)
newTable <- table(cantFamilias)

suma = apply(newTable, 1, sum);

porcentajes = round(c(suma[1],sum(suma[-1]))/length(cantFamilias) * 100,2);

pie(porcentajes , labels = c(
  paste("(",porcentajes[1],"%)",sep=""),
  paste("(",porcentajes[2],"%)",sep="")),
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
mtext("Porcentaje de hogares con 1 o mas grupos familiares", side=3, cex=1.5)
legend("bottomleft", legend = c("Solo 1 grupo familiar", "Mas de un grupo familiar"), fill = c("#01bee6", "#ff4457"))
