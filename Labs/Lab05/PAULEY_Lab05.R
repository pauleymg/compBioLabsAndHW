# R script for Lab05
# EBIO 4420 with Sam Flaxman
# 13 February 2020

setwd("Documents/Courses/EBIO4420/compBioLabsAndHW/Labs/Lab05/")


#---- Part 1 Step 1 ----

x <- 2 # create object with value of my choice

if (x > 5){
    print("x is greater than 5")
} else {
    print("x is smaller than 5")
}

# one-line alternative: ifelse(x > 5, yes = "x is greater than 5", no = "x is smaller than 5")


#---- Part 1 Step 2 ----

# import data
exampleData <- read.csv("ExampleData.csv")

# convert data from data frame to vector
Data <- exampleData[[1]]


#---- Part 1 Step 2a ----

# check each value and convert negative values to NA
for (i in 1:length(Data)){
    if(Data[i] < 0){ # check data less than zero
        Data[i] <- NA # if yes, replace with NA
    }
}


#---- Part 1 Step 2b ----

NAidentifier <- is.na(Data) # make vector of logical T & F that specifies where Data = NA

Data[NAidentifier] <- NaN # index Data by the positions with NA, assign NaN to them


#---- Part 1 Step 2c ----

NaNFinder <- which(is.nan(Data)) # make a vector of numeric positions where Data = NaN

Data[NaNFinder] <- 0 # index Data by the positions with NaN, assign 0 to them


#---- Part 1 Step 2d & Step 2e ----

#set limits of the data we want
lowerBoundary <- 50
upperBoundary <- 100

# push Data points greater than or equal to lower bound into a vector
FiftyToOneHundred <- Data[Data >= lowerBoundary]

# push vector elements less than or equal to upper bound into the vector, overwriting the old vector.
FiftyToOneHundred <- FiftyToOneHundred[FiftyToOneHundred <= upperBoundary] #step 2e solution

# number of data points within specified range
length(FiftyToOneHundred) #step 2d solution


#---- Part 1 Step 2f ----

write.csv(FiftyToOneHundred, file = "FiftyToOneHundred.csv")


#---- Part 1 Step 3 ----

co2Data <- read.csv("CO2_data_cut_paste.csv") # load CO2 dataset


#---- Part 1 Step 3a ----

GasNonZero <- which(co2Data$Gas > 0) # determine all positions at which Gas has a non-zero value

co2Data$Year[GasNonZero[1]] # index year column by the position of the first non-zero Gas datapoint


#---- Part 1 Step 3b ----

# set constraints
TotalLowerBound <- 200 # million metric tons
TotalUpperBound <- 300 # million metric tons

# make vector of positions that fall within both constraints
TotalTwoToThreeHundred <- which(co2Data$Total >= TotalLowerBound & co2Data$Total <= TotalUpperBound)

co2Data$Year[TotalTwoToThreeHundred] # years in which Total CO2 was between constraints


#---- P2 ParameterSetup ----

# Lotka-Volterra parameter set up
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

# Vector Setup
LVTime <- 1:totalGenerations # Time Vector

nOverTime <- rep(0, totalGenerations) # to store n value at each time step
nOverTime[1] <- initPrey # set initial prey abundance

pOverTime <- rep(0, totalGenerations) # to store p value at each time step
pOverTime[1] <- initPred # set initial predator abundance

#---- P2 Loop ----
for(i in 2:totalGenerations){
    # calculate prey population at time step
    nOverTime[i] <- nOverTime[i - 1] + (r * nOverTime[i - 1]) - (a * nOverTime[i - 1] * pOverTime[i - 1])
    
    # check for negative prey value
    if (nOverTime[i] < 0){
        nOverTime[i] <- 0
    }
    
    # calculate predator population at time step
    pOverTime[i] <- pOverTime[i - 1] + (k * a * nOverTime[i - 1] * pOverTime[i - 1]) - (m * pOverTime[i - 1])
}


#---- P2 Plot ----
LineColors <- hcl.colors(n = 2, palette = "Blue-Red 3") # select colors for the plot

# plot prey abundance
plot(LVTime, nOverTime, type = "l", xlab = "Generations", ylab = "Population", lwd = 3, col = LineColors[1], main = "Simulated Lotka-Volterra predator-prey model") 

# add predator abundance data
lines(LVTime, pOverTime, lwd = 3, col = LineColors[2])

# add legend
legend("topright", legend = c("Prey Abundance", "Predator Abundance"), col = LineColors, lwd = 3)



#---- P2 SaveResults ----
# set vectors with desired column names
TimeStep <- LVTime 
PreyAbundance <- nOverTime
PredatorAbundance <- pOverTime

# cbind the vectors into a matrix
myResults <- cbind(TimeStep, PreyAbundance, PredatorAbundance)

write.csv(myResults, file = "PredPreyResults.csv") # write to file

#---- Part 3 ----

#create initial prey abundances
initPreyVec <- seq(from = 10, to = 100, by = 10)

# preallocate a data-holding arrays
RESULTS <- matrix(data = NA, nrow = totalGenerations, ncol = (2 * length(initPreyVec)))
nOverTime <- rep(0, totalGenerations)
pOverTime <- rep(0, totalGenerations)
pOverTime[1] <- initPred

for (h in 1:length(initPreyVec)){
    
    nOverTime[1] <- initPreyVec[h] # set initial prey abundance
    
    for(i in 2:totalGenerations){
        # calculate prey population at time step
        nOverTime[i] <- nOverTime[i - 1] + (r * nOverTime[i - 1]) - (a * nOverTime[i - 1] * pOverTime[i - 1])
        
        # check for negative prey value
        if (nOverTime[i] < 0){
            nOverTime[i] <- 0
        }
        
        # calculate predator population at time step
        pOverTime[i] <- pOverTime[i - 1] + (k * a * nOverTime[i - 1] * pOverTime[i - 1]) - (m * pOverTime[i - 1])
    }
    
    RESULTS[,(2 * h) - 1] <- nOverTime # store prey abundances in odd columns
    RESULTS[,(2 * h)] <- pOverTime # store predator abundances in even columns
}

# convert to data frame
RESULTS <- data.frame(RESULTS)

# create vector of column names, with two-part names:
# "#Trial" specifies initial abundance of prey for that trial
# "_Prey" designates a prey data column
# "_Predator" designates a predator data column
naming <- c("10Trial_Prey", "10Trial_Predator", "20Trial_Prey", "20Trial_Predator", "30Trial_Prey", "30Trial_Predator", "40Trial_Prey", "40Trial_Predatory", "50Trial_Prey", "50Trial_Predator", "60Trial_Prey", "60Trial_Predator", "70Trial_Prey", "70Trial_Predator", "80Trial_Prey", "80Trial_Predator", "90Trial_Prey", "90Trial_Predator", "100Trial_Prey", "100Trial_Predator")

# apply names to result data frame
names(RESULTS) <- naming

# attach timeStep column to result data frame
RESULTSwithTime <- data.frame(TimeStep, RESULTS)
# The data now:
# 1st column: time scale
# even columns: prey abundance (see number in column header for initial prey abundance)
# odd columns from 3 to 21: predatory abundance (see number in column header for initial prey abundance which the predator population responded to)

# Write results with timesteps to file
write.csv(RESULTSwithTime, file = "Part3_ParameterStudyResults.csv")
