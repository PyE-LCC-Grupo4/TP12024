install.packages("tidyverse")
install.packages("gganimate")

library(readxl)
library(ggplot2)
library(tidyverse)
library(gganimate)

source("theme.R")

# URL
df = read_excel("../Datos_LP.xlsx", sheet = "FILTRO");

tabla = as.factor(df$`Posee internet de banda ancha`)
summary(tabla)

sino = c()
for(x in tabla) {
  if(x == "No poseo internet de banda ancha") {
    sino <- append(sino, "No");
  }
  else {
    sino <- append(sino, "Si");
  }
}

data_zero = data.frame(
  value = c("No", "Si", "Si", "Si", "Si"),
  tipo = as.factor(c("No poseo internet de banda ancha", "Si inálambrico/satelital", "Si a través de fibra óptica", "Sí pero no sé qué tipo de servicio tengo en mi vivienda", "Si a través de cable (coaxial o ADSL)")),
  i=0
)

t = table(df$`Posee internet de banda ancha`)
tabla_freq_relativas = t / sum(t)

tabla_freq_relativas

data = data.frame(value=sino, tipo=tabla, i=1);

summary(data)

data = rbind(data_zero, data)

graf = ggplot(data, aes(fill=tipo, x=value)) + 
  geom_bar(colour="black") +
  scale_x_discrete(name="Posee internet") + 
  scale_fill_manual(name = "Tipo de conexion", values=c("#be123c", 
                                                        "#fecdd3", 
                                                        "#fda4af", 
                                                        "#fb7185", 
                                                        "#f43f5e")) +
  scale_y_continuous(name = "Hogares", breaks = seq(0,650,50), limits = c(0,650)) +
  ggtitle("Conexión de banda ancha por hogar") +
  tema +
  transition_states(i, wrap=FALSE)

anim = animate(graf, duration = 3, renderer = gifski_renderer())
anim
anim_save("output.gif", anim)
