# vic_R_codes_II - bars_covid

![](https://onlinelibrary.wiley.com/doi/10.1002/jmv.27261)

This code was designed by Victor Jimenez Vasquez - vr.jimenez.vs@gmail.com.
## Intro
Modern pandemic COVID-19 is currently studied at the molecular level by the genomic surveillance of its ethiological agent: SARS-CoV-2. Many institutions around the world has generated thousands of SARS-CoV-2 genomes and most of them have been deposited in free data-bases like GISAID. The understanding of the evolution of SARS-CoV-2 requires the application of epidemiological, phylogenetic, phylodynamic analyses and so on. The huge amount of genomic information makes untractable many local and fast analysis, moreover there's an asymetric generation of the genomic information: some countries upload hundreds of genomes per epidemiological week while some others no more than tens. It could be very hard and time-consuming in terms of computational resources to carry out a phylogenetic analysis with 100000 or even more than 10000 SARS-CoV-2 genomes. A pure ramdom selected strategy could render an imcomplete subset: only composed of some epidemiological weeks and/or some countries, therefore the conclusions of any study based on pure random selection could be vague, otherwise manual random selection per country and epidemiological week could be really hard and time-consuming. 
"subset_covid" allows the user to obtain data-subset from an original metadata downloaded or compiled from GISAID (https://www.gisaid.org/) based on epidemiological week and country. "subset_covid" extract a percentage of samples above a minimum frequency threshold for all epidemiological weeks and for all countries included in your data. "subset_covid" retains all genomes by epidemiological week and country if those does not exced a minimum frequency threshold, otherwise it extracts only a percentage. "subset_covid" allows the user to obtain a subset data composed of all countries and all epidemioloical weeks, the user can use the resulted accession numbers to extract SARS-CoV-2 genomes directed from GISAID.

## Usage 
```r

#setwd#
setwd("C:/Users/HP/Documents/corridas_sars_cov2/totales_diciembre2021")
dir()
library(ggplot2)
library(gridExtra)
library(lubridate)
source("C:/Users/HP/Documents/vic_r_codes/barras_frequencias/code_2.R")
source("C:/Users/HP/Documents/vic_r_codes/curves/code_inferir_variante.R")
source("C:/Users/HP/Documents/vic_r_codes/mapas/code_maps_alt.R")

d <- read.csv("metadata_f33.tsv", header=TRUE, sep="\t")
names(d) <- c("strain","EPI_ISL","date","division","host","age","gender","pangolin_lineage","VOC.VOI")
data <- inferir_variante(data=d,code="peru_variantes")
names(data)
unique(data$division)

tab <- mes_lin(data=data,month="diciembre",year=2021,min=1,max=8)
tab <- mes_lin(data=data,month="diciembre",year=2021,min=9,max=16)
tab <- mes_lin(data=data,month="diciembre",year=2021,min=17,max=24)

asa <- mes_var(data=data,month="diciembre",year=2021,min=1,max=8)
asa <- mes_var(data=data,month="diciembre",year=2021,min=9,max=16)
asa <- mes_var(data=data,month="diciembre",year=2021,min=17,max=24)

tr <- sem_var(data=data,week=52,year=2021,min=1,max=9)
as <- sem_lin(data=data,week=52,year=2021,min=1,max=4)

```
