install.packages("tidyverse")

# Leo el xlsx
df = read_excel("../Datos_LP.xlsx", sheet = "FILTRO");

library(readxl)
library(ggplot2)
library(tidyverse)
library(gganimate)
library(forcats)
library(dplyr)

source("theme.R")

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

data_zero = data.frame(
  fill = c("No", "Si, hechas por el Estado\n(municipio, provincia o Estado nacional)", "Sí, hechas por vecinxs"),
  value = c("No", "Si", "Si"),
  i=0
);

data = data.frame(
  fill = tipo,
  value = valores,
  i=1
);

data = rbind(data_zero, data)

t = table(df$`Situacion alumbrado publico`)
tabla_freq_relativas = t / sum(t)

tabla_freq_relativas

graf = ggplot(data, aes(fill=fill, x=value)) +
  geom_hline(yintercept = seq(0, 950, 100), col = "lightgrey", linetype = "longdash") +
  geom_bar(position="stack", colour="black") +
  ggtitle("Alumbrado publico en barrios populares") +
  scale_x_discrete(name="¿Posee alumbrado publico?") + 
  scale_fill_manual(name = "", values = c("#be123c",
                                          "#fecdd3", 
                                          "#fda4af") ) +
  scale_y_continuous(name = "Hogares", breaks = seq(0, 1000, 100)) +
  labs(caption=("Fuente: Observatorio villero (2022)")) +
  tema +
  transition_states(i, wrap=FALSE)

anim = animate(graf, duration = 3, renderer = gifski_renderer())
anim
anim_save("output.gif", anim)
