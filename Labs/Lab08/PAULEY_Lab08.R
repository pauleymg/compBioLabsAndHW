# Marshall Pauley
# EBIO4420 Lab08

setwd("Documents/Courses/EBIO4420/compBioLabsAndHW/Labs/Lab08/")


# This function is set up to model logistic population growth in discrete time increments. It will not generate the smooth curve of logistic growth over continuous time.
LogiGrowthModel <- function(r, K, totalGenerations, initPopSize){
    
    endTime <- totalGenerations # 3b
    generations <- 1:endTime # This object holds all the time steps
    CarryingCap <- K # 3b
    IntrinsicGrowthRate <- r # 3b
    abundance <- rep(0, endTime) # this object will hold population abundance at each time step
    abundance[1] <- initPopSize # 3b
    
    for (i in 2:endTime){
        interStep <- ( CarryingCap - abundance[i - 1] ) / CarryingCap # right-hand part of the equation, pushed into an transfer object
        abundance[i] <- abundance[i - 1] + ( IntrinsicGrowthRate * abundance[i - 1] * interStep ) # left-hand part of the equation with transfer object, pushed into data-holding object
    }
    
    plot(generations, abundance, xlab = "Time (in generations)", ylab = "Population Abundance", pch = 18, col = "dodgerblue", cex = 1.5, main = "Discrete-Time Logistic Growth Model") # 3c
    
    # step 3e
    RESULTS <- data.frame(generations, abundance)
    return(RESULTS)
}

# step 3d: call function to test
testModel <- LogiGrowthModel(r = 0.3, K = 10000, totalGenerations = 30, initPopSize = 500)


# step 3e: write to file
write.csv(x = testModel, file = "Lab08_FunctionOutput.csv", row.names = F)
