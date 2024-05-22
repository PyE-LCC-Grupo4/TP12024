install.packages("tidyverse")
install.packages("gganimate")

library(readxl)
library(ggplot2)
library(tidyverse)
library(gganimate)
library(forcats)
library(dplyr)

source("theme.R")

# Leo el xlsx
df = read_excel("../Datos_LP.xlsx", sheet = "FILTRO");

valores = c()

for(x in df$`De que forma obtiene el agua`) {
  if(x == "A través de una conexión sin medidor, es decir “informalmente”, sea a través de una conexión directa a la red pública o a través de una conexión indirecta a través de un vecinx “informalmente”")
    valores = append(valores, "Informalmente")
  else if(x == "No poseo agua dentro de la vivienda y/o tengo que acarrear desde fuera del terreno en que se ubica mi vivienda" )
    valores = append(valores, "No posee agua")
  else
    valores = append(valores, x)
}


t = table(df$`De que forma obtiene el agua`)
tabla_freq_relativas = t / sum(t)

tabla_freq_relativas

data_zero = data.frame(
  x = as.factor(c("Conexión a un tanque comunitario", "No sabe", "A través de un camión cisterna", "No poseo agua dentro de la vivienda y/o tengo que acarrear desde fuera del terreno en que se ubica mi vivienda", "A través de un pozo", "A través de una conexión con medidor a la red pública", "A través de una conexión sin medidor, es decir “informalmente”, sea a través de una conexión directa a la red pública o a través de una conexión indirecta a través de un vecinx “informalmente”")),
  fill = c("Conexión a un tanque comunitario", "No sabe", "A través de un camión cisterna", "No posee agua", "A través de un pozo", "A través de una conexión con medidor a la red pública", "Informalmente"),
  i=0
)

data = data.frame(
  x = as.factor(df$`De que forma obtiene el agua`),
  fill = valores,
  i=1
)

data = rbind(data_zero, data)

mutated_data = mutate(data, 
                      x = fct_relevel(x, "Conexión a un tanque comunitario", "No sabe", "A través de un camión cisterna", "No poseo agua dentro de la vivienda y/o tengo que acarrear desde fuera del terreno en que se ubica mi vivienda", "A través de un pozo", "A través de una conexión con medidor a la red pública", "A través de una conexión sin medidor, es decir “informalmente”, sea a través de una conexión directa a la red pública o a través de una conexión indirecta a través de un vecinx “informalmente”"),
                      fill = fct_relevel(fill, "Conexión a un tanque comunitario", "No sabe", "A través de un camión cisterna", "No posee agua", "A través de un pozo", "A través de una conexión con medidor a la red pública", "Informalmente"))

graf = ggplot(mutated_data, aes(x=x, fill=fill)) +
  geom_bar(color="black") +
  xlab("") +
  ylab("Hogares") +
  scale_y_continuous(name = "Hogares", breaks = seq(0,680,200), limits = c(0,680)) +
  scale_fill_manual(name = "¿Como obtiene el agua?",values=c("#ffe4e6", 
                                                             "#fecdd3", 
                                                             "#fda4af", 
                                                             "#fb7185", 
                                                             "#f43f5e", 
                                                             "#e11d48", 
                                                             "#be123c")) +
  guides(x="none") +
  labs(title = "Disponibilidad del agua en hogares de barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  tema +
  transition_states(i, wrap=FALSE)

anim = animate(graf, duration = 3, renderer = gifski_renderer())
anim
anim_save("output.gif", anim)

print(paste("Mediana:",median(df$`Cantidad Integrantes`)));
print(paste("Rango intercuartilico:",IQR(df$`Cantidad Integrantes`)))
