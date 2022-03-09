# vic_R_codes - bars_covid

![](https://onlinelibrary.wiley.com/doi/10.1002/jmv.27261)
![barras_mes_lin](https://user-images.githubusercontent.com/89874227/150564002-35038c3f-f643-4194-863b-bc598fb6f363.jpg)

This code was designed by Victor Jimenez Vasquez - vr.jimenez.vs@gmail.com.
## Intro
Modern pandemic COVID-19 is currently studied at the molecular level by the genomic surveillance of its ethiological agent: SARS-CoV-2. Many institutions around the world has generated thousands of SARS-CoV-2 genomes and most of them have been deposited in free data-bases like GISAID. The understanding of the evolution of SARS-CoV-2 requires the application of epidemiological, phylogenetic, phylodynamic analyses and so on. The huge amount of genomic information makes untractable many local and fast analysis, moreover there's an asymetric generation of the genomic information: some countries upload hundreds of genomes per epidemiological week while some others no more than tens. It could be very hard and time-consuming in terms of computational resources to carry out a phylogenetic analysis with 100000 or even more than 10000 SARS-CoV-2 genomes. A pure ramdom selected strategy could render an imcomplete subset: only composed of some epidemiological weeks and/or some countries, therefore the conclusions of any study based on pure random selection could be vague, otherwise manual random selection per country and epidemiological week could be really hard and time-consuming. 
"subset_covid" allows the user to obtain data-subset from an original metadata downloaded or compiled from GISAID (https://www.gisaid.org/) based on epidemiological week and country. "subset_covid" extract a percentage of samples above a minimum frequency threshold for all epidemiological weeks and for all countries included in your data. "subset_covid" retains all genomes by epidemiological week and country if those does not exced a minimum frequency threshold, otherwise it extracts only a percentage. "subset_covid" allows the user to obtain a subset data composed of all countries and all epidemioloical weeks, the user can use the resulted accession numbers to extract SARS-CoV-2 genomes directed from GISAID.

## Usage 
```r
# "bars_covid" requires some R libraries #
library(ggplot2)
library(gridExtra)
library(lubridate)

#paste "bars_covid.R" file in your working directory#
source("bars_covid.R")

#read your data#
d <- read.csv("metadata_f33.tsv", header=TRUE, sep="\t")

#we strictly need the following column names#
names(d) <- c("strain","EPI_ISL","date","division","host","age","gender","pangolin_lineage","VOC.VOI")

## 1 ##
#prepare function: sem_lin#
#sem_lin generates a lineage report per year and a given epidemiological week for all divisions#
sem_lin <- function(data,week,year,min,max){
data = data frame containing the data. 
week = epidemiological week according to CDC criteria. 
year = dessired year 
min = if your data includes 20 divisions (departments or provinces), "min" argument specifies the first divion to plot, equals the minimun range of divisions to plot.   
max = if your data includes 20 divisions (departments or provinces), "max" argument specifies the last divions to plot, equals the maximum range of divisions to plot. 

#example#
as <- sem_lin(data=data,week=52,year=2021,min=1,max=4)

tab <- mes_lin(data=data,month="diciembre",year=2021,min=1,max=8)
tab <- mes_lin(data=data,month="diciembre",year=2021,min=9,max=16)
tab <- mes_lin(data=data,month="diciembre",year=2021,min=17,max=24)

asa <- mes_var(data=data,month="diciembre",year=2021,min=1,max=8)
asa <- mes_var(data=data,month="diciembre",year=2021,min=9,max=16)
asa <- mes_var(data=data,month="diciembre",year=2021,min=17,max=24)

tr <- sem_var(data=data,week=52,year=2021,min=1,max=9)
as <- sem_lin(data=data,week=52,year=2021,min=1,max=4) 

```
## Output
Frequency barplots indicating number of genomes in y-axis and variant/lineage in x-axis per week/month for a set of regions. 

## Usage
Use "bars_covid" to explore the lineage/variant progression of the pandemic per week/month in a set of regions for a given country.  

This code was designed by Victor Jimenez Vasquez - vr.jimenez.vs@gmail.com.

Vic

