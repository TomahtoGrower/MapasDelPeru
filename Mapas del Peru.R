########################################################################################################
####
####    Mapa del Perú a nivel departamental, provincial y distrital
####
########################################################################################################
# Cargamos las librerias que vamos a necesitar
if (!require("pacman")) install.packages("pacman")
pacman::p_load(dplyr)
pacman::p_load(raster)

# Para este ejemplo, vamos a utilizar los datos de Peru.
## Para buscar otros paises, ir a: https://gadm.org/index.html

# Peru
### Descargamos los datos a nivel país
per_0 <- getData("GADM", country = "PER", level = 0)
### Gráfico a nivel país
ggplot() +
  geom_polygon(data = per_0,
               aes(x = long, y = lat, group = group),
               color = "black",
               fill = "coral3") +
  labs(title = "Perú", 
       x = "Longitud",
       y = "Latitud") +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "grey"))

## Datos a nivel departamental
### Descargamos la data a nivel de departamentos
per_1 <- getData("GADM", country = "PER", level = 1)
### Gráfico a nivel de departamento
ggplot() +
  geom_polygon(data = per_1,
               aes(x = long, y = lat, group=group),
               color= "white",
               fill = "coral3")+
  labs(title = "Perú: Departamentos",
       x = "Longitud",
       y = "Latitud") +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "grey"))

## Datos a nivel provincial
### Descargamos la data a nivel de provincias
per_2 <- getData("GADM", country = "PER", level = 2)
### Gráfico a nivel de provincia
ggplot() +
  geom_polygon(data = per_2,
               aes(x = long, y = lat, group=group),
               color= "white",
               fill = "coral3")+
  labs(title = "Perú: Provincias",
       x = "Longitud",
       y = "Latitud") +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "grey"))

## Datos a nivel distrital
### Descargamos la data a nivel de distritos
per_3 <- getData("GADM", country = "PER", level = 3)
#### Gráfico a nivel de provincia
ggplot() +
  geom_polygon(data = per_3,
               aes(x = long, y = lat, group=group),
               color= "white",
               fill = "coral3",
               size = 0.1)+
  labs(title = "Perú: Distritos",
       x = "Longitud",
       y = "Latitud") +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "grey"))

## Solo mostrar las provincias del departamento de Lima
### Creamos una sub-base solo para el departamento de lima
per_2_sub <- subset(per_2, NAME_1 %in% c("Lima"))
#### Gráfico de las provincias del departamento de Lima
ggplot() +
  geom_polygon(data = per_2_sub,
               aes(x = long, y = lat, group=group),
               color= "white",
               fill = "coral3",
               size = 0.1)+
  labs(title = "Lima: Provincias",
       x = "Longitud",
       y = "Latitud") +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "grey"))

## Solo mostrar los distritos de la provincia de Lima
### Creamos una sub-base solo para la provincia de lima
per_3_sub <- subset(per_3, NAME_2 %in% c("Lima"))
#### Gráfico de las distritos de la provincia de Lima
ggplot() +
  geom_polygon(data = per_3_sub,
               aes(x = long, y = lat, group=group),
               color= "white",
               fill = "coral3",
               size = 0.1)+
  labs(title = "Provincia de Lima: Distritos",
       x = "Longitud",
       y = "Latitud") +
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "grey"))
