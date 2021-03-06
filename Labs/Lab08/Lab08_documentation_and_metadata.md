# Lab08: Discrete-Time Logistic Growth Model

### Contents
This repo contains an R script with a function for modelling population growth, and an example spreadsheet and example plot of the function's output.

### Why it exists
I created this partly to make experimenting with different values easy, partly because it was assigned in [Samuel Flaxman's CompBio on git class](https://github.com/flaxmans/CompBio_on_git/blob/master/Labs/Lab08/Lab08_documentation_and_metadata.md).

## PAULEY_Lab08 Rscript

### What's it do?
This script defines a function which models population growth, assuming discrete time intervals and limited resources. 

### Required Inputs
* `r` = the intrinsic growth rate of the population
* `K` = the carrying capacity
* `totalGenerations` = how many discrete time intervals the model will run
* `initPopSize` = population abundance at the beginning of the simulation

### Input Handling
The LogiGrowthModel function renames `r` to `IntrinsicGrowthRate` and `K` to `CarryingCap`, but otherwises uses them as they were input, without modification.

The `totalGenerations` input is used three times  
* to create a sequence of time intervals: `generations <- 1:totalGenerations`  
* to define the length of the abundance vector: `abundance <- rep(0, totalGenerations)`  
* and to define the end of the sequence over which the for loop runs: `for (i in 2:totalGenerations)`

Finally, the `initPopSize` is assigned to the first position in the abundance vector: `abundance[1] <- initPopSize`

### The Equation
The function implements this equation

```
n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
```

In my implementation, `n[t]` is represented by `abundance[i]`, and `n[t-1]` is represented by `abundance[i - 1]`  
The whole equation appears as follows within the for loop:

```
abundance[i] <- abundance[i - 1] + ( IntrinsicGrowthRate * abundance[i - 1] * ( (CarryingCap - abundance[i - 1]) / CarryingCap ) )
```

For more on the theory behind this equation, see [this site](https://vlab.amrita.edu/?sub=3&brch=65&sim=1110&cnt=1).

### Plot output
After the equation, my function produces a plot of the data.  
* Independent variable: `generations` (whole-number sequence of time-steps the simulation ran)  
* Dependent variable: `abundance` (vector of population abundances at each time-step, generated during the for loop)  
The Result will look something like this:

![Here's an example plot](https://raw.githubusercontent.com/pauleymg/compBioLabsAndHW/master/Labs/Lab08/LogisticGrowthFunction_Example.png)

### Data output
To create numeric output that can be written to a file, the function combines the `generations` and `abundance` vectors into a matrix, and returns the matrix as the function's result, like so:

```
RESULTS <- data.frame(generations, abundance)
    return(RESULTS)
```

### Usage
This LogiGrowthModel function may be called, and its results (matrix of time and abundance) pushed into an object. As of this version, no defaults have been defined for any of the arguments, so all four must be supplied, like so:

```
testModel <- LogiGrowthModel(r = 0.3, K = 10000, totalGenerations = 30, initPopSize = 500)
```

Note: the values shown above were used to generate the example Plot output

The matrix generated by the LogiGrowthModel function may be written to file by use of any of R's "write.filetype" functions.

```
write.csv(x = testModel, file = "Lab08_FunctionOutput.csv", row.names = F)
```

To do so, make  
* `x =` the name of the object you assigned to hold the function's output  
* `file = ` the filename you wish to appear within your folder, with the file extension (.csv, .xlsx)  
* `row.names = F` recommended to avoid having an unnamed column of integers

The written file may look something like [this](https://github.com/pauleymg/compBioLabsAndHW/blob/master/Labs/Lab08/Lab08_FunctionOutput.csv)

