install.packages("tidyverse")

library(readxl)
library(ggplot2)

# URL
df = read_excel("C:\\Users\\USUARIO\\Downloads\\Datos_LP.xlsx", sheet = "FILTRO");

# Plagas por hogar
cucaracha = as.factor(df$`Plaga cucaracha`)
mosquito = as.factor(df$`Plaga mosquito`)
rata = as.factor(df$`Plaga Ratas`);

valores = c();
fill = c();
for(i in 1:1222) {
  cant = (!is.na(cucaracha[i])) + (!is.na(mosquito[i])) + (!is.na(rattata[i]));
  if(cant != 0)
  {
    label = paste(as.character(cant), " plagas");
    tipo = "";
    
    if(!is.na(cucaracha[i])){
      tipo = paste(tipo, "cucaracha, ");
    }
    
    if(!is.na(mosquito[i])){
      tipo = paste(tipo, "mosquito, ");
    }
    
    if(!is.na(rata[i])){
      tipo = paste(tipo, "rata, ");
    }
  }
  else {
    label = paste(as.character(cant), " plagas (No posse)");
    tipo = "";
    tipo = paste(tipo, "No posee plagas");
  }
  
  fill = append(fill, tipo);
  valores=append(valores, label);
}

data = data.frame(fill = fill, value = valores)

ggplot(data, aes(fill=fill, x=value)) +
  geom_hline(yintercept = seq(0, 400, 50), col = "lightgrey", linetype = "longdash") +
  theme(panel.background = element_blank()) +
  geom_bar(position="dodge") +
  labs(title = "Plagas en los hogares",
       caption = "Fuente: Observatorio villero (2022)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_discrete(name="Cantidad de plagas") + 
  scale_fill_discrete(name = "") +
  scale_y_continuous(name = "Hogares", breaks = seq(0,400,50))