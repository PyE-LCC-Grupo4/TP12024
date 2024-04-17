library(Hmisc)

cocina = as.factor(df$`Tiene agua caliente en la cocina`)
baño = as.factor(df$`Tiene agua caliente en el baño`)

valores = c()
for(x in append(cocina,baño)) {
  if(is.na(x) | x == "No tengo agua caliente en el baño" | x == "No tengo agua caliente")
    valores = append(valores, "No tengo agua caliente")
  else
    valores = append(valores, capitalize(substring(x,5)));
}

data = data.frame(value = valores,
                  lugar = as.factor(c(rep("Cocina", 1222), rep("Baño", 1222))));

ggplot(data, aes(fill=value, x=lugar)) + 
  geom_bar(position="dodge") +
  scale_x_discrete(name="Lugar donde tiene la conexion") + 
  scale_fill_discrete(name = "Tipo de conexion") +
  theme_bw() +
  ggtitle("Disponibilidad del agua caliente") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(name = "Hogares", breaks = seq(0,1000,50))

