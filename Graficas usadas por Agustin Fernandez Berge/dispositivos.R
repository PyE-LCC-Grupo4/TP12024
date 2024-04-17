install.packages("tidyverse")

library(readxl)
library(ggplot2)

# URL
df = read_excel("C:\\Users\\USUARIO\\Downloads\\Datos_LP.xlsx", sheet = "FILTRO");

compus = as.factor(df$`Cantidad de computadoras`)
tele = as.factor(df$`Cantidad de telefonos o tablets`)

suma_compus <- round(apply(table(compus), 1, sum)/length(compus),2)
suma_tele <- round(apply(table(tele), 1, sum)/length(compus),2)
suma_tele

data = data.frame(
  x=c(0,1,2,3,4,5,0,1,2,3,4,5),
  fill=append(rep("Computadoras",6),rep("Telefonos",6)),
  fr = append(suma_compus,suma_tele)
)

ggplot(data, aes(x=x, y=fr, color=fill)) +
  geom_line(size=2) +
  xlab("Cantidad de dispositivos") +
  ylab("Frecuencias relativas") +
  ggtitle("Cantidad de dispositivos por hogar") +
  scale_color_discrete(name="Tipo de dispositivo") +
  scale_y_continuous(limits = c(0,0.75), breaks=c(0,0.125,0.25,0.375,0.50,0.625,0.75)) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

