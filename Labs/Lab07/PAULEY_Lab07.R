# EBIO4420 Computational Biology with Sam Flaxman, Lab 07
# Marshall Pauley

setwd("Documents/Courses/EBIO4420/compBioLabsAndHW/Labs/Lab07/")

#---- Problem 1 ----

# create function to calculate area of a triangle, given base and height
myTriangleArea <- function(base, height){
    # step 1: multiply
    myResult <- base * height * 0.5
    # step 2: return result
    return(myResult)
}

# demonstrate it works
# suppose a triangle with base 10 units, and height of 9 units
myTriangleArea(base = 10, height = 9)


#---- Problem 2a ----

# create an absolute value function, given scalar or vector numeric input
myAbs <- function(input){
    # step 1: identify any negative values
    NegativeID <- input < 0
    # step 2: switch signs on negative values
    input[NegativeID] <- input[NegativeID] * -1
    # step 3: return result
    return(input)
}

# demonstrate it works
# test a few scalar values (positive & negative)
myAbs(input = 5)
myAbs(input = -2.3)


#---- Problem 2b ----

# create test vector
AbsTest <- c(1.1, 2, 0, -4.3, 9, -12)

# demonstrate my absolute value function works with a vector input
myAbs(AbsTest)


#---- Problem 3 ----

# create function to generate the first "n" fibonacci numbers, given quantity
suchFibonacci <- function(n, s = 0){
    if (n == 1){ # bonus 3a
        FibStorage <- s # handle n = 1
    } else if (n == 2){ # bonus 3a
        FibStorage <- c(s, 1) # handle n = 2
    } else if (n <= 0){ # bonus 3b
        FibStorage <- "Error: Fibonacci sequence cannot have no length or negative length" # return warning message if n is zero or negative
    } else if (n %% 1 != 0){ # bonus 3b
        FibStorage <- "Error: Fibonacci sequence must have a whole-number length" # return warning message if n is not an integer
    } else { #main solution
        # preallocate storage vector of length equivalent to the given n
        FibStorage <- rep(0, n)
        # set second fibonacci number (the first was already given 0 in the line above)
        FibStorage[1] <- s
        FibStorage[2] <- 1
        # populate fibonacci numbers into storage vector
        for (i in 3:n){
            FibStorage[i] <- FibStorage[i - 1] + FibStorage[i - 2]
        }
    }
    # return fibonacci numbers
    return(FibStorage)  
}

# demonstrate my fibonacci function works
# testing: standard inputs
suchFibonacci(3)
suchFibonacci(42, s = 1)

# testing: sensible low inputs
suchFibonacci(2)
suchFibonacci(1)

# testing: nonsensible inputs
suchFibonacci(0)
suchFibonacci(-6)
suchFibonacci(7.2)

#---- Problem 4a ----

# create function to get the square of a difference, given two numbers 
squareOfDifference <- function(x, y){
    # calculate the square of the difference
    sqDif <- (x - y) ^ 2
    return(sqDif) #return result
}

# demonstate it works
# suppose two scalar values
squareOfDifference(3, 5)
# suppose a vector and a scalar value
squareOfDifference(c(2, 4, 6), 4)

#---- Problem 4b ----

# create an arithmetic mean function, given a vector of numbers
manualArithMean <- function(x){
    sumX <- sum(x) # sum elements
    newMean <- sumX / length(x) # divide sum by number of elements
    return(newMean)
}

# demonstration
manualArithMean(c(5, 10, 15))

# load data
labSevenData <- read.csv("../../../Sandbox/CompBio_on_git/Labs/Lab07/DataForLab07.csv")
# test my arithmetic mean function on the data set
manualArithMean(labSevenData$x)

#---- Problem 4c ----

# create function to calculate the sum of squares, given a vector of numbers
SumOSquares <- function(input){
    newMean <- manualArithMean(input) # get the arithmetic mean of the input
    differenceVector <- squareOfDifference(input, newMean) # take difference between the mean and each data point, square it
    Result <- sum(differenceVector) # sum all elements
    return(Result)
}

# demonstrate my sum of squares function works on the data set
SumOSquares(labSevenData$x)
