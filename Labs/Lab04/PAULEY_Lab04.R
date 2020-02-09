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
}

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
currentPopulation <- 2000
shrinkage <- 0.95 # 5% decline
Years <- 1:7

# step 3 solution
for (i in Years){
    currentPopulation <- currentPopulation * shrinkage
    print(currentPopulation)
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
QuantityOfZeroes <- 18
RepeatedZero <- rep(0, QuantityOfZeroes) 

#---- step 5b ----
multiplicationFactor <- 3
for (i in 1:QuantityOfZeroes){
    RepeatedZero[i] <- i * multiplicationFactor
}
print(RepeatedZero)

#---- step 5c ----
Placeholder <- rep(0, QuantityOfZeroes)
Placeholder[1] <- IntegerOne

#---- step 5d ----
for (i in 2:QuantityOfZeroes){
    Placeholder[i] <- IntegerOne + (IntegerTwo * Placeholder[i - 1])
}
print(Placeholder)

#---- step 6 ----
FibEnd <- 20 # how many fibonacci numbers we want to generate
FibonacciSeq <- rep(0, FibEnd)
FibonacciSeq[2] <- IntegerOne 
for (i in 3:FibEnd){
    FibonacciSeq[i] <- FibonacciSeq[i - IntegerOne] + FibonacciSeq[i - IntegerTwo]
}
print(FibonacciSeq)

#---- step 7 ----
# storage accomplished in step 4

plot(TimeSteps, PopulationSteps, xlab = "Time Steps", ylab = "Population Abundance")

#---- step 8a ----
Carbon <- read.csv("CO2_data_cut_paste.csv")
str(Carbon)

#---- step 8b ----
# read.csv with colClasses argument
CarbonData <- read.csv(file = "CO2_data_cut_paste.csv", colClasses = c("integer", rep("numeric", 7)))
str(CarbonData)

# for loop
totalColumns <- 8
for (i in 2:totalColumns){
    Carbon[,i] <- as.numeric(Carbon[,i])
    } # Matilde came up with this for-loop solution
str(Carbon)

