# Marshall Pauley
# Lab 11 -- EBIO 4420 with Samuel Flaxman

setwd("Documents/Courses/EBIO4420/compBioLabsAndHW/Labs/Lab11/")

DatWood <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)

#rename density column
colnames(DatWood)[4] <- "WoodDensity_gcm3"

#---- Part 4 ----
#seek NAs
NAfinder <- is.na(DatWood$WoodDensity_gcm3)
DrekRow <- which(NAfinder) # 4a solved

#remove NAs
DatWood <- DatWood[!NAfinder,] # 4b solved

#---- Part 5 ----
# determine number of unique wood types
allTypes <- unique(DatWood$Binomial)

library("dplyr")

# group up the species
by_species <- DatWood %>% 
    group_by(Binomial, Family) %>%
    summarise(MeanDensity = mean(WoodDensity_gcm3))

#---- Part 6 ----
# find family densities
by_family <- by_species %>%
    group_by(Family) %>%
    summarise(MeanDensity = mean(MeanDensity)) #6a

# order them
by_family <- by_family[order(by_family$MeanDensity), ] #6b

# 8 least & most dense families
LeastDense <- head(by_family, n = 8) #6c
MostDense <- tail(by_family, n = 8) #6c

#---- Part 7 ----
library("ggplot2")

# subset out data from part 5 for plotting ####INCOMPLETE####
theScouts <- names(LeastDense)
LightWood <- (by_species$Binomial %in% theScouts)

theHeavies <- names(MostDense)
HeavyWood <- (by_species$Binomial %in% theHeavies)
