# Lab 12

#---- Prep Work ----

# set working directory
setwd("~/Documents/Courses/EBIO4420/compBioLabsAndHW/Labs/Lab12")

# load Cusack et al data (note: I copied the CSV from Lab09, so the missing line ending is fixed, probably)
CusackRaw <- read.csv(file = "Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# load packages
library("ggplot2")
library("dplyr")

#---- Problem 1 ----

# plot the data in bar graph form-factor using ggplot
ggplot(data = CusackRaw) +
    geom_bar(mapping = aes(x = Species)) # add stat = "identity" AFTER the aes() to tell geom_bar not to use it's own count

#---- Problem 2 ----

# again, but turn the axis labels to be readable
ggplot(data = CusackRaw) +
    geom_bar(mapping = aes(x = Species)) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))

#---- Problem 3 ----

# cross tabulate
SpeciesTab <- with(CusackRaw, table(Species))
# convert to data frame
SpeciesTab <- as.data.frame(SpeciesTab, stringsAsFactors=F)

# Change orientation, sort, and scale logarithmically
ggplot(data = SpeciesTab) +
    geom_bar(mapping = aes(y = Freq, x = reorder(Species, -Freq)), stat = "identity") + 
    coord_flip() +
    scale_y_log10() +
    labs(x = "Species", y = "Count")
