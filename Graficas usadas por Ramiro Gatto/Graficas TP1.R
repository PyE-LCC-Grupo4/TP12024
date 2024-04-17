install.packages("readxl")
# Alternatively, install just ggplot2:
install.packages("tidyverse")

library(readxl)
library(ggplot2)

# URL
df = read_excel("C:\\Users\\USUARIO\\Desktop\\Datos_LP (1).xlsx", sheet = "FILTRO");

#1- Cantidad miembros en el hogar
data = data.frame(integrantes = as.factor(df$`Cantidad Integrantes`))
ggplot(data, aes(x=integrantes)) +
  geom_bar(fill="#4dd0e1", color="black", width=.1) +
  xlab("Integrantes") +
  ylab("Hogares") +
  labs(title = "Cantidad de integrantes por vivienda en barrios populares",
       caption = "Fuente: Observatorio villero (2022)") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


#2- Edad jefe del hogar
data=data.frame(value=df$`Edad jefe/a del hogar`)
boxplot(data,
        main = strsplit(c("Edad del jefe de la casa por hogares en barrios populares"), split = ";"),
        xlab = "Edad",
        ylim = c(15, 90),
        col = "#4dd0e1",
        horizontal = TRUE,
        sub= "Fuente: Observatorio villero (2022)",
        xaxp = c(10, 90, 8))


#3- Menores por Tiempo en la vivienda
plot(df$`Tiempo de residencia en la vivienda actual (en años)`, df$`Menores`,
     main = strsplit(c("Tiempo en la residencia (año) por cantidad de menores \n en barrios populares"), split = ";"),
     xlab = "Tiempo de residencia en la vivienda actual (en años)",
     pch = 19, col = "#4dd0e1",
     ylab = "Menores en la residencia",
     ylim = c(0,10),
     xlim = c(0, 60),
     xaxp = c(0, 60, 6),
     sub= "Fuente: Observatorio villero (2022)")


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


#5- Cantidad de telefono/tablets en el hogar
frec <- table(df$`Cantidad de telefonos o tablets`)
frec_rel <- round(frec/sum(frec), 6)
frec_acum <- cumsum(frec)

plot(frec_rel, type="l", xaxt="n",lwd=3, col = "#4dd0e1",
     ylab="Frecuencia relativas",
     sub="Fuente: Observatorio villero (2022)",
     xlab = "Cantidad de telefonos")

mtext("Cantidad de telefonos o tablets en el hogar \n en barrios populares", side=3,  cex = 2)
valores_eje_X=c(0,1,2,3,4,5,6)
axis(1, at=0:6, labels =valores_eje_X)
abline(h = seq(0, 0.3, by = 0.05), lty = 2, col = "gray")

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



#7- Como se obtien el agua
pie(c(23, 89, 381, 660,8, 49, 12),
    labels = paste(round((c(23, 89, 381, 660,8, 49, 12)/1222)*100, digits = 2),"%"), 
    edges = 200, radius = 0.8,
    clockwise = FALSE, init.angle = 45,
    density = NULL, angle = 45, col = c("#f68440", "#f03c59", "#bc6ccb", "#623eba", "#4dd0e1", "#1f8c8c","#06b1ce"), border = NULL,
    sub= "Fuente: Observatorio villero (2022)",
    lty = NULL, main = NULL)

casos <- c("Camión cisterna", 
           "Pozo",
           "Medidor",
           "Informalmente", "Tanque comunitario" ,
           "No posee agua", "No sabe")

legend("bottomleft", legend = casos, fill = c("#f68440", "#f03c59", "#bc6ccb", "#623eba", "#4dd0e1", "#1f8c8c","#06b1ce"))
mtext("Como se obtiene el agua en barrios populares", side = 3, line = 1, cex = 2)

#8- Capacidad de almacenaje
capAlmacenaje = as.factor(df$`Capacidad almacenaje`);
newTable <- table(capAlmacenaje)

barplot(newTable, horiz = TRUE,
        cex.axis = par("cex.axis"),
        cex.names = par("cex.axis"),
        col = "#4dd0e1", 
        ylab = "Capacidad de almacenaje", 
        xlab = "Hogares",
        sub= "Fuente: Observatorio villero (2022)",
        xlim = c(0,300),
        xaxp = c(0, 300,12))
mtext("Capacidad de almacenaje por hogar \n en barrios populares", side=3, cex=2)

#9- Posee baño
pie(c(1205, 17),
    labels = paste(round((c(1205,17)/1222)*100, digits = 2),"%"), cex = 1.5, 
    edges = 200, radius = 0.8,
    clockwise = TRUE, init.angle = 90,
    density = NULL, angle = 45, col = c("#4dd0e1", "#f03c59"), border = NULL,
    sub= "Fuente: Observatorio villero (2022)",
    lty = NULL, main = NULL)

mtext("Porcentaje de gente que poseen baño \n en barrios populares", side=3, cex=2)
legend("bottomleft", legend = c("Tienen baño", "No tienen baño"), fill = c("#4dd0e1", "#f03c59"))


#10- Calle asfaltada Vs. años en la vivienda
attach(df)
boxplot(`Tiempo de residencia en la vivienda actual (en años)`~`Calles asfaltadas`,
        main = strsplit(c("Calles asfaltadas por tiempo de residencia \n en barrios populares"), split = ";"),
        sub = "Fuente: Observatorio villero (2022)",
        xlab = "Calles afaltadas",
        ylim = c(0,80),
        col = "#4dd0e1")

#11- Alumbrado Publico
alumbrado = as.factor(df$`Situacion alumbrado publico`)

valores = c()
for(x in alumbrado){
  if(x == "No"){
    valores = append(valores, "No");
  }
  else {
    valores = append(valores, "Si");
  }
}

data = data.frame(
  fill = alumbrado,
  value = valores
);

ggplot(data, aes(fill=fill, x=value)) +
  geom_hline(yintercept = seq(0, 950, 100), col = "lightgrey", linetype = "longdash") +
  geom_bar(position="stack") +
  ggtitle("Alumbrado publico en barrios populares") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_blank()) +
  scale_x_discrete(name="Alumbrado publico") + 
  scale_fill_discrete(name = "") +
  scale_y_continuous(name = "Hogares", breaks = seq(0, 1000, 100)) +
  labs(caption=("Fuente: Observatorio villero (2022)"))

#12- Plagas
cucaracha = as.factor(df$`Plaga cucaracha`)
mosquito = as.factor(df$`Plaga mosquito`)
rata = as.factor(df$`Plaga Ratas`);

valores = c();
fill = c();
for(i in 1:1222) {
  cant = (!is.na(cucaracha[i])) + (!is.na(mosquito[i])) + (!is.na(rata[i]));
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
  ggtitle("Plagas en los hogares, barrios populares") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_discrete(name="Cantidad de plagas") + 
  scale_fill_discrete(name = "") +
  scale_y_continuous(name = "Hogares", breaks = seq(0,400,50))




