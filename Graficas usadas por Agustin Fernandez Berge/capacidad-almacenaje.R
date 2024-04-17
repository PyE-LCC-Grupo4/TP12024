install.packages("tidyverse")

library(readxl)
library(ggplot2)
library(forcats)
library(dplyr)

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

data = data.frame(
  x = valores,
  y = labels
)

mutated_data = mutate(data, y = fct_relevel(y, "Más de 500 lts", "200 a 500 lts", "Menos de 200 lts", "No tienen capacidad de almacenaje"))

ggplot(mutated_data, aes(x=x, y = y)) +
  geom_bar(stat="identity", fill="red", alpha=.6, width=.8) +
  xlab("Hogares") +
  ylab("Capacidad de almacenaje") +
  labs(title = "Capacidad de almacenaje de agua por hogar",
       caption = "Fuente: Observatorio villero (2022)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

