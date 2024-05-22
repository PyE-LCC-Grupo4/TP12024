install.packages("tidyverse")
install.packages("gganimate")

library(readxl)
library(ggplot2)
library(forcats)
library(dplyr)
library(tidyverse)
library(gganimate)

source("theme.R")
# Leo el xlsx
df = read_excel("../Datos_LP.xlsx", sheet = "FILTRO");

i= as.factor(df$`Capacidad almacenaje`);

labels = c("No tienen capacidad de almacenaje\no no almacenan agua", "Menos de 200 lts", "200 a 500 lts", "Más de 500 lts")
valores = c(0,0,0,0)

for(x in i) {
  if(is.na(x)) {
    valores[1]=valores[1]+1;
  }
  else {
    for(j in 2:4)
      if(labels[j] == x)
        valores[j] = valores[j]+1;
  }
}



data_zero = data.frame(
  x = c(0,0,0,0),
  y = c("Más de 500 lts", "200 a 500 lts", "Menos de 200 lts", "No tienen capacidad de almacenaje\no no almacenan agua"),
  i=0
)

data = data.frame(
  x = valores,
  y = labels,
  i=1
)

data = rbind(data_zero,data)
mutated_data = mutate(data, y = fct_relevel(y, "Más de 500 lts", "200 a 500 lts", "Menos de 200 lts", "No tienen capacidad de almacenaje\no no almacenan agua"))

graf = ggplot(mutated_data, aes(x=x, y = y)) +
  geom_bar(stat="identity", fill="white", colour = "#2a3990", width=.8) +
  xlab("Hogares") +
  ylab("Capacidad de almacenaje") +
  labs(title = "Capacidad de almacenaje de agua por hogar",
       caption = "Fuente: Observatorio villero (2022)") +
  tema +
  transition_states(i, wrap=FALSE)

anim = animate(graf, duration = 3, renderer = gifski_renderer())
anim
anim_save("output.gif", anim)

