install.packages("tidyverse")

# Leo el xlsx
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");

library(readxl)
library(ggplot2)

# Alumbrado
alumbrado = as.factor(df$`Situacion alumbrado publico`)

tipo = c()
valores = c()
for(x in alumbrado){
  if(x == "No"){
    valores = append(valores, "No");
  }
  else {
    valores = append(valores, "Si");
  }
  
  if(x=="Sí, hechas por el Estado (municipio, provincia o Estado nacional)") {
    tipo = append(tipo, "Si, hechas por el Estado\n(municipio, provincia o Estado nacional)");
  }
  else {
    tipo = append(tipo, x);
  }
}

data = data.frame(
  fill = tipo,
  value = valores
);

ggplot(data, aes(fill=fill, x=value)) +
  geom_hline(yintercept = seq(0, 950, 100), col = "lightgrey", linetype = "longdash") +
  geom_bar(position="stack") +
  ggtitle("Alumbrado publico en barrios populares") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_blank()) +
  scale_x_discrete(name="¿Posee alumbrado publico?") + 
  scale_fill_discrete(name = "") +
  scale_y_continuous(name = "Hogares", breaks = seq(0, 1000, 100)) +
  labs(caption=("Fuente: Observatorio villero (2022)"))