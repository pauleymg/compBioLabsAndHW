# Marshall Pauley 
# EBIO 4420 CompBio_on_git Lab09

setwd("Documents/Courses/EBIO4420/compBioLabsAndHW/Labs/Lab09/")

# import data
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = FALSE)


#---- Problem 1 ----

# create small example to test on
BiteSizedPiece <- rbind(head(camData), tail(camData))
# test procedure
ConvertedBite <- strptime(x = biteSizedPiece$DateTime, format = "%d/%m/%Y %H:%M", tz = "EAT") # I'm currently going on the assumption that the time stamps were on the local timezone in Tanzania, where the photos were taken
# this didn't work so well for a 2-digit year, as expected

# Convert all Dates and Times 
dateAndTime <- strptime(x = camData$DateTime, format = "%d/%m/%Y %H:%M", tz = "EAT") 


#---- Problem 2 ----

# Observed: while it's not a very portable solution, I note that the study was carried out in 2013-2014. This means that all years in the 4-digit format should have the digits "201" together, but the 2-digit format years will not.
# This can be applied to find all of the 4-digit year rows
FourDigitYearTrue <- grepl(pattern = "201", x = dateAndTime)
# Used with a "!" this object allows indexing the 2-digit year rows (there being only two year formats in this script, all rows which lack a 4-digit year should have a 2-digit year).


#---- Problem 3 ----

# Create an accurate vector of dates and times

# apply four-digit formatting to the rows where four-digit format was found
dateAndTime[which(FourDigitYearTrue)] <- strptime(x = camData$DateTime[FourDigitYearTrue], 
                                                  format = "%d/%m/%Y %H:%M", 
                                                  tz = "EAT")
# apply two-digit formatting to the rows where four-digit format was NOT found
dateAndTime[which(!FourDigitYearTrue)] <- strptime(x = camData$DateTime[!FourDigitYearTrue], 
                                                   format = "%d/%m/%y %H:%M", 
                                                   tz = "EAT")
# take the new date and time vector, and append it onto the data frame as a column (I could have replaced the original one, but I chose to be non-destructive, just in case)
camData$NewDateTime <- dateAndTime

#---- Problem 4 ----

# goal: determine the average time between observations for some combination of Season, Species, and Station

# the Question: what's the average time between observations of all cat species during the Wet season?

# Rows pertaining to cats in the wet season were isolated using the CatExtraction.sh shell script.
WetCats <- read.csv(file = "Cusack_et_al_Wet_Cats.csv", stringsAsFactors = FALSE)

# apply formatting to years as before
# try to apply four-year formatting to all rows
catDates <- strptime(x = WetCats$DateTime, 
                     format = "%d/%m/%Y %H:%M", 
                     tz = "EAT")

# find four-year formatted rows
FourYrCats <- grepl(pattern = "201", x = catDates)

# apply two-year formatting to all other rows
catDates[which(!FourYrCats)] <- strptime(x = WetCats$DateTime[!FourYrCats], 
                                         format = "%d/%m/%y %H:%M", 
                                         tz = "EAT")

# replace original DateTime column
WetCats$DateTime <- catDates

# create a vector of differences between times of sighting of any cat
SightingDifference <- abs( WetCats$DateTime[2 : nrow(WetCats)] - WetCats$DateTime[1 : nrow(WetCats) - 1] )

# Find average time between sightings
AvgTimeBetweenSoggyCats <- mean(SightingDifference)
