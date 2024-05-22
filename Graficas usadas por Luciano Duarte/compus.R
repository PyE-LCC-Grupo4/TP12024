install.packages("readxl")
# Alternatively, install just ggplot2:
install.packages("tidyverse")

library(readxl)
library(ggplot2)

# URL
df = read_excel("Datos_LP.xlsx", sheet = "FILTRO");
summary(df);

#6- Porcentaje computadoras disponibles
data = data.frame(integrantes = as.factor(df$`Cantidad de computadoras`))
ggplot(data, aes(x=integrantes)) +
  geom_bar(fill="#4dd0e1", color="black", width=.1) +
  xlab("Cantidad de computadoras por hogar") +
  scale_y_continuous(name = "Hogares", breaks = seq(0, 900, 50)) +
  labs(title = "Cantidad de computadoras por hogar \n en barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))