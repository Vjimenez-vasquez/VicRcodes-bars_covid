#### plot loop ###
library(ggplot2)
library(gridExtra)
library(lubridate)

## 1 ##
#prepare function: sem_lin#
#sem_lin genera reporte de linajes para el año y la semana epidemiologica seleccionados para todas las regiones#

sem_lin <- function(data,week,year,min,max){
data=data
week=week
year=year
min=min
max=max
#read data#
data <- data.frame(data, n=rep(1,dim(data)[1]),week=epiweek(ymd(data$date)),year=year(ymd(data$date)),
month=month(ymd(data$date)),month_name=month(ymd(data$date),label=TRUE))
#create frequencies table#
data <- aggregate(data$n, by=list(data$year,data$division,data$week,data$pangolin_lineage), FUN=sum)
names(data) <- c("year","division","week","pangolin_lineage","freq")

#prepare function#
j = week
k = year
data <- data[data$week == j & data$year == k,]
dim(data)
g <-  list()
names = unique(data$division)
for (i in as.factor(names)) 
{

a <- paste0("Region:",i)
b <- paste0("Semana:",j)
c <- paste0("Año:",k)

g[[i]] <- ggplot(data=data[data$division == i,],aes(x=pangolin_lineage, y=freq, fill=pangolin_lineage)) +
geom_bar(stat="identity") + xlab("Linaje") + ylab("Frecuencia") + theme_minimal() + theme(legend.position = 'none') + 
ggtitle(paste(a,b,c)) + scale_x_discrete(guide = guide_axis(angle = 45)) + ylim(0,1.1*(max(data[data$division == i,5]))) +
geom_text(aes(label=freq), vjust=-0.5, color="black", position = position_dodge(1), size=3.5)
}
do.call(grid.arrange,g[min:max])
}

#apply#
#example 1: week= 40, year=2021#          
#sem_lin(data,40,2021)#
#example 2: week= 20, year=2021#
#sem_lin(data,20,2021)#
#example 2: week= 10, year=2021#
#sem_lin(data,10,2021)#

## 2 ##
#prepare function: sem_var#
#sem_var genera reporte de variantees para el año y la semana epidemiologica seleccionados para todas las regiones#

sem_var <- function(data,week,year,min,max){
data=data
week=week
year=year
min=min
max=max
#read data#
data <- data.frame(data, n=rep(1,dim(data)[1]),week=epiweek(ymd(data$date)),year=year(ymd(data$date)),
month=month(ymd(data$date)),month_name=month(ymd(data$date),label=TRUE))

#create frequencies table#
data <- aggregate(data$n, by=list(data$year,data$division,data$week,data$variante), FUN=sum)
names(data) <- c("year","division","week","variante","freq")

j = week
k = year
data <- data[data$week == j & data$year == k,]
dim(data)
g <-  list()
names = unique(data$division)
for (i in as.factor(names)) 
{

a <- paste0("Region:",i)
b <- paste0("Semana:",j)
c <- paste0("Año:",k)

g[[i]] <- ggplot(data=data[data$division == i,],aes(x=variante, y=freq, fill=variante)) +
geom_bar(stat="identity") + xlab("Variante") + ylab("Frecuencia") + theme_minimal() + theme(legend.position = 'none') + 
ggtitle(paste(a,b,c)) + scale_x_discrete(guide = guide_axis(angle = 45)) + ylim(0,1.1*(max(data[data$division == i,5]))) +
geom_text(aes(label=freq), vjust=-0.5, color="black", position = position_dodge(1), size=3.5)
}
do.call(grid.arrange,g[min:max])
}

#apply#
#example 1: week= 40, year=2021#
#sem_lin(data,40,2021)#
#example 2: week= 20, year=2021#
#sem_lin(data,20,2021)#
#example 2: week= 10, year=2021#
#sem_lin(data,10,2021)#

## 3 ##
#prepare function: mes_var#
#mes_var genera reporte de variantees para el año y el mes seleccionados para todas las regiones#

mes_var <- function(data,month,year,min,max){
data=data
month=month
year=year
min=min
max=max
#read data#
data <- data.frame(data, n=rep(1,dim(data)[1]),week=epiweek(ymd(data$date)),year=year(ymd(data$date)),
month=month(ymd(data$date)),month_name=month(ymd(data$date),label=TRUE,abbr = FALSE))
#create frequencies table#
data <- aggregate(data$n, by=list(data$year,data$division,data$month_name,data$variante), FUN=sum)
names(data) <- c("year","division","month_name","variante","freq")

j = month
k = year
data <- data[data$month_name == j & data$year == k,]
dim(data)
g <-  list()
names = unique(data$division)
for (i in as.factor(names)) 
{

a <- paste0("Region:",i)
b <- paste0("Mes:",j)
c <- paste0("Año:",k)

g[[i]] <- ggplot(data=data[data$division == i,],aes(x=variante, y=freq, fill=variante)) +
geom_bar(stat="identity") + xlab("Variante") + ylab("Frecuencia") + theme_minimal() + theme(legend.position = 'none') + 
ggtitle(paste(a,b,c)) + scale_x_discrete(guide = guide_axis(angle = 45)) + ylim(0,1.1*(max(data[data$division == i,5]))) +
geom_text(aes(label=freq), vjust=-0.5, color="black", position = position_dodge(1), size=3.5)
}
do.call(grid.arrange,g[min:max])
}

#apply#
#example 1: month= Julio, year=2021#
#mes_lin(data,"July",2021)#
#example 2: month= Enero, year=2021#
#mes_lin(data,"January",2021)#
#example 3: month= Noviembre, year=2021#
#mes_lin(data,"November",2021)#

## 4 ##
#prepare function: mes_lin#
#mes_lin genera reporte de linajes para el año y el mes seleccionados para todas las regiones#

mes_lin <- function(data,month,year,min,max){
data=data
month=month
year=year
min=min
max=max
#read data#
data <- data.frame(data, n=rep(1,dim(data)[1]),week=epiweek(ymd(data$date)),year=year(ymd(data$date)),
month=month(ymd(data$date)),month_name=month(ymd(data$date),label=TRUE,abbr = FALSE))
#create frequencies table#
data <- aggregate(data$n, by=list(data$year,data$division,data$month_name,data$pangolin_lineage), FUN=sum)
names(data) <- c("year","division","month_name","pangolin_lineage","freq")

j = month
k = year
data <- data[data$month_name == j & data$year == k,]
dim(data)
g <-  list()
names = unique(data$division)
for (i in as.factor(names)) 
{

a <- paste0("Region:",i)
b <- paste0("Mes:",j)
c <- paste0("Año:",k)

g[[i]] <- ggplot(data=data[data$division == i,],aes(x=pangolin_lineage, y=freq, fill=pangolin_lineage)) +
geom_bar(stat="identity") + xlab("Linaje") + ylab("Frecuencia") + theme_minimal() + theme(legend.position = 'none') + 
ggtitle(paste(a,b,c)) + scale_x_discrete(guide = guide_axis(angle = 45)) + ylim(0,1.1*(max(data[data$division == i,5]))) +
geom_text(aes(label=freq), vjust=-0.5, color="black", position = position_dodge(1), size=3.5)
}
do.call(grid.arrange,g[min:max])
}

#apply#
#example 1: month= Julio, year=2021#
#mes_lin(data,"July",2021)#
#example 2: month= Enero, year=2021#
#mes_lin(data,"January",2021)#
#example 3: month= Noviembre, year=2021#
#mes_lin(data,"November",2021)#