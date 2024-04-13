install.packages("tidyverse")

library(readxl)
library(ggplot2)

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");

varones = sum(df$Varones)
mujeres = sum(df$Mujeres)
genero_disidente = sum(df$Disidente)

data = data.frame(
  valor = c(varones, mujeres, genero_disidente),
  genero = c("Varones", "Mujeres", "Genero disidente")
)

ggplot(data, aes(x=genero, y=valor, fill=genero)) +
  geom_bar(stat="identity") +
  scale_fill_manual(values = c("green", "pink", "cyan") ) +
  scale_y_continuous(name="Viviendas", breaks=seq(0,3000,500)) +
  xlab("Genero") +
  labs(title = "Genero de habitantes de barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5), legend.position="none")

