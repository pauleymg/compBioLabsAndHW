# EBIO4420 Computational Biology with Sam Flaxman, Lab 07
# Marshall Pauley

setwd("Documents/Courses/EBIO4420/compBioLabsAndHW/Labs/Lab07/")

#---- Problem 1 ----

# create function, given base and height
myTriangleArea <- function(base, height){
    # step 1: multiply base * height * 0.5
    myResult <- base * height * 0.5
    # step 2: return result
    return(myResult)
}

# demonstrate it works
myTriangleArea(base = 10, height = 9)


#---- Problem 2a ----

# Build my own absolute value function, given scalar or vector numeric input
myAbs <- function(input){
    # step 1: identify any negative values
    NegativeID <- input < 0
    # step 2: switch signs on negative values
    input[NegativeID] <- input[NegativeID] * -1
    # step 3: return result
    return(input)
}

# demonstrate it works
myAbs(input = 5)
myAbs(input = -2.3)


#---- Problem 2b ----

# create test vector
AbsTest <- c(1.1, 2, 0, -4.3, 9, -12)

# demonstrate it works
myAbs(AbsTest)


#---- Problem 3 ----

# create function, given quantity of desired fibonacci numbers
suchFibonacci <- function(n){
    if (n == 1){ # bonus 3a
        FibStorage <- 0 # handle n = 1
    } else if (n == 2){ # bonus 3a
        FibStorage <- c(0, 1) # handle n = 2
    } else if (n <= 0){ # bonus 3b
        FibStorage <- "Warning: Fibonacci sequence cannot have no length or negative length" # return warning message if n is zero or negative
    } else if (n%%1!=0){ # bonus 3b
        FibStorage <- "Warning: Fibonacci sequence must have an integer length" # return warning message if n is not an integer
    } else { #main solution
        # preallocate storage vector of length equivalent to the given quantity
        FibStorage <- rep(NA, n)
        # set first two fibonacci numbers
        FibStorage[1] <- 0
        FibStorage[2] <- 1
        # populate fibonacci numbers into storage vector
        for (i in 3:n){
            FibStorage[i] <- FibStorage[i - 1] + FibStorage[i - 2]
        }
    }
    # return fibonacci numbers
    return(FibStorage)  
}

# testing: standard inputs
suchFibonacci(3)
suchFibonacci(42)

# testing: sensible low inputs
suchFibonacci(2)
suchFibonacci(1)

# testing: nonsensical inputs
suchFibonacci(0)
suchFibonacci(-6)
suchFibonacci(7.2)

#---- Problem 4a ----

# create function, given two numbers 
squareOfDifference <- function(x, y){
    # calculate the square of the difference
    sqDif <- (x - y) ^ 2
    return(sqDif)
}

# demonstation
squareOfDifference(3, 5)
squareOfDifference(c(2, 4, 6), 4)

#---- Problem 4b ----

# create function, given a vector of numbers
manualArithMean <- function(x){
    sumX <- sum(x) # sum elements
    newMean <- sumX / length(x) # divide sum by number of elements
    return(newMean)
}

# demonstration
manualArithMean(c(5, 10, 15))

# load data
labSevenData <- read.csv("../../../Sandbox/CompBio_on_git/Labs/Lab07/DataForLab07.csv")
# test on data
manualArithMean(labSevenData$x)

#---- Problem 4c ----

# create function, given a vector of numbers
SumOSquares <- function(input){
    newMean <- manualArithMean(input) # get the mean of the input
    differenceVector <- squareOfDifference(input, newMean) # take difference between the mean and each data point, square it
    Result <- sum(differenceVector) # sum all elements
    return(Result)
}

# demonstration time
SumOSquares(labSevenData$x)
