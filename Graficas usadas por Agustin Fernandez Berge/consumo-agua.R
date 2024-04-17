install.packages("tidyverse")

library(readxl)
library(ggplot2)

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");

valores = c()

for(x in df$`De que forma obtiene el agua`) {
  if(x == "A través de una conexión sin medidor, es decir “informalmente”, sea a través de una conexión directa a la red pública o a través de una conexión indirecta a través de un vecinx “informalmente”")
    valores = append(valores, "Informalmente")
  else if(x == "No poseo agua dentro de la vivienda y/o tengo que acarrear desde fuera del terreno en que se ubica mi vivienda" )
    valores = append(valores, "No posee agua")
  else
    valores = append(valores, x)
}

data = data.frame(
  x = as.factor(df$`De que forma obtiene el agua`),
  fill = valores
)

ggplot(data, aes(x=x, fill=fill)) +
  geom_bar(color="black") +
  xlab("") +
  ylab("Hogares") +
  scale_fill_discrete(name = "¿Como obtiene el agua?") +
  guides(x="none") +
  labs(title = "Disponibilidad del agua en hogares de barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

print(paste("Mediana:",median(df$`Cantidad Integrantes`)));
print(paste("Rango intercuartilico:",IQR(df$`Cantidad Integrantes`)))
