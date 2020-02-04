#Marshall Pauley
#EBIO4420
#Lab03

#----Part_1----

#lab step #3: create variables for the number of cheetos bags present at the start of the night, and the number of guests expected to attend
initialChipBags <- 5
numberOfGuests <- 8

#lab step #5: to determine the amount of chips remaining at the end of the evening, take the average consumption, and multiply that by the number of guests + 1 (to account for the host). This product will then be subtracted from the number of chip bags you start with.
averageBagConsumption <- 0.4

#lab step #7: calculate the amount of chips (in number of bags) that will be left over at the end of the evening
leftoverChips <- initialChipBags - ((numberOfGuests + 1) * averageBagConsumption)

#----Part_2----

#lab step #8: create vectors to store the ratings each person gave each Star Wars movie at the end of the marathon
selfRating <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
pennyRating <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
lennyRating <- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
stewieRating <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)

#lab step #9: save Penny and Lenny's ratings for Episode IV
PennyIV <- pennyRating[4]
LennyIV <- lennyRating[4]

#lab step #10: merge all the ranking vectors to form a matrix using cbind()
allRating <- cbind(selfRating, pennyRating, lennyRating, stewieRating)

#lab step #11: use str() to inspect several objects
str(PennyIV)
str(pennyRating)
str(allRating)
# PennyIV is a single number, pennyRating a string of numbers (a vector), and allRating is a set of characters each having its own vector of numbers.

#lab step #12: convert the ranking matrix into a data frame
rankDF <- as.data.frame(allRating) #from a matrix
rankDF <- data.frame(selfRating, pennyRating, lennyRating, stewieRating) #from vectors

#lab step #13: compare object from step #10 (allRating) to one of the two created in step #12 (rankDF)
dim(allRating)
dim(rankDF)
# they look the same in dim (identical data)

str(allRating)
str(rankDF)
#in str they look quite different. str on the dataframe is actually helpful

allRating == rankDF
#all data checks out as the same

typeof(allRating)
typeof(rankDF)
#these are different types. The matrix is "double" and the data frame is a "list", though I don't yet know what that really means

print(allRating)
print(rankDF)
#print displays the row names a bit differently with default names on the matrix.

# while the data held within both objects appears the same and is arranged the same way when viewed, R stores the data in different ways. While there may be more subtle differences, str() function on the data frame returns a more informative result in console than the matrix (also later I discovered that the "$" can be used to specify a column in a data frame, but not a matrix)

#lab step #14: make a vector of the roman numeral numbers for each episode
episodeNumerals <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

#lab step #15: add row names to the objects created in steps 10 & 12
row.names(allRating) <- episodeNumerals
row.names(rankDF) <- episodeNumerals

#lab step #16: Access third row of matrix from step #10 (allRating)
allRating[3,]

#lab step #17: Access the fourth column of the data frame from step #12 (rankDF)
rankDF[,4]

#lab step #18: Access my ranking for episode V.
allRating[5,1]

#lab step #19: Access Penny's ranking for episode II
allRating[2,2]

#lab step #20: Access everyone's rankings for episodes IV - VI (original trilogy)
allRating[4:6,]

#lab step #21: Access everyone's rankings for episodes II, V, VII
allRating[c(2,5,7),]

#lab step #22: Access Penny & Stewie's ranking for episodes IV and VI
allRating[c(4,6),c(2,4)]

#lab step #23: in an object from step 10 or 12, switch Lenny's rankings for episodes II and V.
LennySWAP <- rankDF[c(2,5),3]
rankDF[2,3] <- LennySWAP[2]
rankDF[5,3] <- LennySWAP[1]
#other way: rankDF[c(2,5),3] <- rankDF[c(5,2),3] #does the swap both at once

#lab step #24: Try indexing with row and column names
allRating["III", "pennyRating"]
rankDF["III", "pennyRating"]

#lab step #25: index with row and column names to undo step #23's swap
rankDF[c("V", "II"), "lennyRating"] <- rankDF[c("II", "V"), "lennyRating"]

#lab step #26: use $ operator to specify columns (variables) and redo step #23's swap
rankDF$lennyRating[c(5,2)] <- rankDF$lennyRating[c(2,5)]