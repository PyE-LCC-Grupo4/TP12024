install.packages("tidyverse")

library(readxl)
library(ggplot2)

# URL
df = read_excel("C:\\Users\\USUARIO\\Downloads\\Datos_LP.xlsx", sheet = "FILTRO");

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
  geom_bar() +
  scale_x_discrete(name="Posee internet") + 
  scale_fill_discrete(name = "Tipo de conexion") +
  scale_y_continuous(name = "Hogares", breaks = seq(0,650,50)) +
  ggtitle("Conexión de banda ancha por hogar") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

