# Marshall Pauley
# EBIO4420 -- Computational Biology
# Independent Project Script

setwd("~/Documents/Courses/EBIO4420/compBioLabsAndHW/IndependentProject/")

# Load data set
Data <- read.csv("NoteData.csv", stringsAsFactors = F)

# prepare the date data to be useable
Data$Date <- as.Date(x = Data$Date, format = "%d/%m/%y") # note: day first, and two digit year



#####   Part 1: Frequency of Days by Number of Entries  #####

# The first analysis regards whether certain days were more productive than others.

# Create counts of how many times each date appears in the data
IdeasPerDayTab <- as.data.frame(table(Data$Date))
colnames(IdeasPerDayTab) <- c("Date", "Entries") # more appropriate column names

require(ggplot2)

# create a histogram showing how many days a certain number of ideas were generated
ggplot(IdeasPerDayTab) +
    geom_histogram(mapping = aes(x = Entries) , stat = "count", fill = "steelblue", col = "gray20") +
    labs(x = "Ideas Per Day", y = "Frequency") +
    theme_minimal()



#### Part 2: How Dominant is the Most Common Project? ####

# The second analysis regards visualizing whether the most prolific project outcompetes others for limited time

# begin by removing lines not associated with a project
UNASfinder <- Data$Project=="unas" # this is effectively NA, so we'll remove them
PrjData <- Data[!UNASfinder, ]

# establish the time-span between first and last date
firstDate <- min(PrjData$Date)
lastDate <- max(PrjData$Date)
# The span of time is 14 months.

require(dplyr)

# Group Data by project for graphing
EntriesByProject <- PrjData %>%
    group_by(Project) %>% 
    summarise(Entries = n())

# plot the number of entries for each project
ggplot(EntriesByProject) +
    geom_bar(mapping = aes(x = reorder(Project, -Entries), y = Entries, fill = Project), stat = "identity") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    ggtitle("Differential Project Abundance Over 14 Months") +
    labs(x = "Project Moniker") +
    guides(fill = FALSE) +
    scale_fill_ordinal()

# Regroup, but this time keep the "unas" entries for comparison
UnassignedVSProjects <- Data %>%
    group_by(Project) %>% 
    summarise(Entries = n())

# plot project-less against the projects
ggplot(UnassignedVSProjects) +
    geom_bar(mapping = aes(x = reorder(Project, -Entries), y = Entries, fill = Project), stat = "identity") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    ggtitle("Differential Project Abundance Over 14 Months") +
    labs(x = "Project Moniker") +
    guides(fill = FALSE) +
    scale_fill_ordinal()
