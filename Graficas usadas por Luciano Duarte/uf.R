install.packages("readxl")
# Alternatively, install just ggplot2:
install.packages("tidyverse")

library(readxl)
library(ggplot2)

#4- Hogares con banda ancha
tabla = as.factor(df$`Posee internet de banda ancha`)

sino = c()
for(x in tabla) {
  if(x == "No poseo internet de banda ancha") {
    sino <- append(sino, "No");
  }
  else {
    sino <- append(sino, "Si");
  }
}

data = data.frame(value=sino, tipo=tabla);

ggplot(data, aes(fill=tipo, x=value)) +
  geom_hline(yintercept = seq(0, 650, 50), col = "lightgrey", linetype = "longdash") +
  geom_bar() +
  scale_x_discrete(name="Posee internet") + 
  scale_fill_discrete(name = "Tipo de conexion") +
  ggtitle("Internet de banda ancha en barrios populares") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_blank()) +
  scale_y_continuous(name = "Hogares", breaks = seq(0,650,50)) +
  labs(caption=("Fuente: Observatorio villero (2022)"))
