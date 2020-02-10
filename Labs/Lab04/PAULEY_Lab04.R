# EBIO4420: Lab 04

# set working directory
setwd("~/Documents/Courses/EBIO4420/compBioLabsAndHW/Labs/Lab04/")

IntegerOne <- 1 # will use later
IntegerTwo <- 2 # will use this later too

#---- step 1 ----
greeting <- "hi" # cheery message
howMany <- 1:10 # how many times the for loop cycles

# step 1 solution
for(i in howMany){
    print(greeting)
} # prints message desired number of times

#---- step 2 ----
TimMoneyInitial <- 10 # Dollars
TimAllowance <- 5 # Dollars
GumPerWeek <- 2 # how many packs of gum does Tim buy each week
GumPrice <- 1.34 # price of gum (includes tax)
Weeks <- 1:8 # how many times the for loop cycles

# step 2 solution
for(i in Weeks){
    LiquidAssests <- TimMoneyInitial + (TimAllowance * Weeks[i]) # allowance + initial funds
    LossesAccounted <- LiquidAssests - ( (GumPerWeek * GumPrice) * Weeks[i] ) # subtract expenditure
    print(LossesAccounted) # display result
}

#---- step 3 ----
currentPopulation <- 2000 # number of individuals in the population, but not for long
shrinkage <- 0.95 # 5% decline
Years <- 1:7 # how many years to project forward

# step 3 solution
for (i in Years){
    currentPopulation <- currentPopulation * shrinkage # mutliply population to estimate decline
    print(currentPopulation) # print result every loop cycle
}

#---- step 4 ----
endTime <- 12 # how many years of observations
TimeSteps <- 1:endTime # This object holds all the time steps (for part 7)
CarryingCap <- 10000 # represented by K
IntrinsicGrowthRate <- 0.8 # r 
PopulationSteps <- rep(0, endTime) # this object will hold population abundance at each time step (after the for loop)
PopulationSteps[1] <- 2500 # n at t = 1

print(PopulationSteps[1]) # initial population
for (i in 2:endTime){
    interStep <- ( CarryingCap - PopulationSteps[i - 1] ) / CarryingCap # right-hand part of the eqn, pushed into an transfer object
    PopulationSteps[i] <- PopulationSteps[i - 1] + ( IntrinsicGrowthRate * PopulationSteps[i - 1] * interStep ) # left-hand part of the eqn with transfer object, pushed into data-holding object
    print(PopulationSteps[i]) 
}
# PopulationSteps now contains population abundance data for each time step (for part 7)

#---- step 5a ----
QuantityOfZeroes <- 18 # number of positions desired in the vector
RepeatedZero <- rep(0, QuantityOfZeroes) # spawn vector of desired length, filled with "0" at every position

#---- step 5b ----
multiplicationFactor <- 3 # it's an object with the number 3 in
for (i in 1:QuantityOfZeroes){
    RepeatedZero[i] <- i * multiplicationFactor # multiply the position number by the object created above.
}
print(RepeatedZero)

#---- step 5c ----
Placeholder <- rep(0, QuantityOfZeroes) # another 18 0s as a placeholder vector
Placeholder[1] <- IntegerOne <- # place the number 1 at the first position
print(Placeholder)

#---- step 5d ----
for (i in 2:QuantityOfZeroes){
    Placeholder[i] <- IntegerOne + (IntegerTwo * Placeholder[i - 1])
}
print(Placeholder)

#---- step 6 ----
FibEnd <- 20 # how many fibonacci numbers we want to generate
FibonacciSeq <- rep(0, FibEnd) # placeholder zeros, however many were specified above
FibonacciSeq[2] <- IntegerOne # place 1 at the second position
for (i in 3:FibEnd){ # we start at three to avoid overwriting the 0 & 1 in positions 1 & 2.
    FibonacciSeq[i] <- FibonacciSeq[i - IntegerOne] + FibonacciSeq[i - IntegerTwo] #math of the Fibonacci sequence
}
print(FibonacciSeq)

#---- step 7 ----
# storage accomplished in step 4

plot(TimeSteps, PopulationSteps, xlab = "Time Steps", ylab = "Population Abundance") # Visualizing the data

#---- step 8a ----
Carbon <- read.csv("CO2_data_cut_paste.csv") # load data

#---- step 8b ----
# read.csv with colClasses argument
CarbonData <- read.csv(file = "CO2_data_cut_paste.csv", colClasses = c("integer", rep("numeric", 7))) #load data with style

# for loop
for (i in 2:ncol(Carbon)){
    Carbon[,i] <- as.numeric(Carbon[,i])
    } # Matilde came up with this for-loop solution

#---- step 8c ----

#-# for loop approach
interim <- list() # creates a blank list to push into

for (i in 2:nrow(Carbon)){
    interim[[i]] <- ((Carbon[i,] - Carbon[i - 1,]) / Carbon[i - 1,]) * 100
} # a non-nested for loop solution. Runs the math & pushes to an empty list

NewCarbon <- do.call(what=rbind.data.frame, interim) # turn the list into a data frame (learned this trick from StackOverflow user Marek, who answered a similar question for someone else)

NewCarbon$Year <- Carbon$Year[2:nrow(Carbon)] # The for-loop mangled the year column. This fixes it.


#-# element by element approach
func <- function(x) c(NA, (tail(x, - 1) - head(x, - 1)) / head(x, - 1) * 100) # function to calculate percent change

NewCarbon2 <- sapply(Carbon[, sapply(Carbon, is.numeric)], func) # this, and the above function, based on MPhD's answer to isuckatcoding's question on StackOverflow.
NewCarbon2 <- as.data.frame(NewCarbon2)
NewCarbon2$Year <- Carbon$Year[1:nrow(Carbon)] # my function busted the year column. Fixed.
NewCarbon2 <- NewCarbon2[-c(1),] # excising first row, which is all NA.

# Compare results 
na.exclude(NewCarbon) == na.exclude(NewCarbon2) # comparing the output of the for loop to that of the function.

#---- step 8d ----

#create a csv using the data from one of the two methods
write.csv(NewCarbon, file = "YearlyPercentChangesInCO2.csv")