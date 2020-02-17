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
plot(LVTime, nOverTime, type = "l", xlab = "Generations", ylab = "Population", lwd = 3, col = LineColors[1], main = "Results of Simulated Lotka-Volterra predator-prey model") 

# add predator abundance data
lines(LVTime, pOverTime, lwd = 3, col = LineColors[2])

# add legend
legend("topright", legend = c("Prey Abundance", "PredatorAbundance"), col = LineColors, lwd = 3)



#---- P2 SaveResults ----
# set vectors with desired column names
TimeStep <- LVTime 
PreyAbundance <- nOverTime
PredatorAbundance <- pOverTime

# cbind the vectors into a matrix
myResults <- cbind(TimeStep, PreyAbundance, PredatorAbundance)

write.csv(myResults, file = "PredPreyResults.csv") # write to file


#---- Part 3 ----

initPreyVec <- seq(from = 10, to = 100, by = 10) # set starting values

# create result dataframe or matrix
RESULTS <- matrix(NA, nrow = length(LVTime), ncol = 2 * length(initPreyVec)) # odd number columns will store prey data, even number columns will store predator data. This allows the results for both predator and prey from a simulation to be adjacent (for example: the prey column for the trial in which the prey population starts at 20 will have its corresponding predator population in the column to the right).

for (i in 1:length(initPreyVec)){
    VectordN <- rep(0, totalGenerations) # to store n value at each time step
    VectordN[1] <- initPreyVec[i] # set initial prey abundance, swapping value on each cycle
    
    VectordP <- rep(0, totalGenerations) # to store p value at each time step
    VectordP[1] <- initPred # set initial pred abundance
    
    # Vectorized Lotka-Volterra prey equation
    VectordN[2:length(LVTime)] <- nOverTime[1:length(LVTime) - 1] + (r * nOverTime[1:length(LVTime) - 1]) - (a * nOverTime[1:length(LVTime) - 1] * pOverTime[1:length(LVTime) - 1]) #calculate n[t]
    
    negativeRemover <- VectordN < 0 # locate the positions of all negative prey results
    VectordN[negativeRemover] <- 0 # set negative prey results to zero
    
    VectordP[2:length(LVTime)] <- pOverTime[1:length(LVTime) - 1] + (k * a * nOverTime[1:length(LVTime) - 1] * pOverTime[1:length(LVTime) - 1]) - (m * pOverTime[1:length(LVTime) - 1]) # calculate p[t]
    
    RESULTS[, (2 * i) - 1] <- VectordN # push prey results into odd # column
    RESULTS[, (2 * i)] <- VectordP # push predator results to even # column
}

# convert to data frame
RESULTS <- data.frame(RESULTS)

# create descriptive column names 
#(number refers to the starting prey population)
#(text indicates whether the column tracks prey or predators)
ColNaming <- c("PreyInit10", "PredResp10", "PreyInit20", "PredResp20", "PreyInit30", "PredResp30", "PreyInit40", "PredResp40", "PreyInit50", "PredResp50", "PreyInit60", "PredResp60", "PreyInit70", "PredResp70", "PreyInit80", "PredResp80", "PreyInit90", "PredResp90", "PreyInit100", "PredResp100")
names(RESULTS) <- ColNaming # affix column names to data frame

# append time column onto data frame
RESULTS$TimeStep <- LVTime

# write data to file
write.csv(RESULTS, file = "Part3_ParameterStudyResults.csv")
