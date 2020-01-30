#Marshall Pauley
#EBIO4420
#Lab03

#----Part_1----

#lab step #3: create variables for the number of cheetos bags present at the start of the night, and the number of guests expected to attend
initialChipBags <- 5
numberOfGuests <- 8

#lab step #5: create an object which stores the average portion of a bag that we expect the guests to eat
averageBagConsumption <- 0.4

#lab step #7: calculate the amount of chips (in number of bags) that will be left over at the end of the evening
leftoverChips <- initialChipBags - (numberOfGuests * averageBagConsumption)

#----Part_2----

#lab step #8: create vectors to store the ratings each person gave each Star Wars movie at the end of the marathon
selfRating <- c(7, 6, 5, 1, 2, 3, 4)
pennyRating <- c(5, 7, 6, 3, 1, 2, 4)
jennyRating <- c(4, 3, 2, 7, 6, 5, 1)
lennyRating <- c(1, 7, 3, 4, 6, 5, 2)
stewieRating <- c(6, 7, 5, 4, 3, 1, 2)

#lab step #9: save Penny and Lenny's ratings for Episode IV
PennyIV <- pennyRating[4]
LennyIV <- lennyRating[4]

#lab step #10: merge all the ranking vectors to form a matrix using cbind()
allRating <- cbind(selfRating, pennyRating, jennyRating, lennyRating, stewieRating)

#lab step #11: use str() to inspect several objects
str(PennyIV)
str(pennyRating)
str(allRating)
# PennyIV is a single number, pennyRating a string of numbers (a vector), and allRating is a set of characters each having its own vector of numbers.

#lab step #12: convert the ranking matrix into a data frame
vectorDataFrame <- as.data.frame(allRating) #from a matrix
vectorDataFrame <- data.frame(selfRating, pennyRating, jennyRating, lennyRating, stewieRating) #from vectors

#lab step #13: compare object from step #10 (allRating) to one of the two created in step #12 (vectorDataFrame)
dim(allRating)
dim(vectorDataFrame)

str(allRating)
str(vectorDataFrame)

allRating == vectorDataFrame

typeof(allRating)
typeof(vectorDataFrame)
#typeof
# while the data held within both objects appears the same and is arranged the same way when viewed, R stores the data in different ways. As best I can tell, the matrix (allRating) is being stored as both a list of numbers and a list of names, whereas the data frame (vectorDataFrame) has all the data stored as a single list. While there may be more subtle differences, using the str() function on the data frame returns a more informative result in console (that looks how I'd expect)

#lab step #14: make a vector of the roman numeral numbers for each episode
episodeNumerals <- c("I", "II", "III", "IV", "V", "VI", "VII")

#lab step #15: add row names to the objects created in steps 10 & 12
row.names(allRating) <- episodeNumerals
row.names(vectorDataFrame) <- episodeNumerals
# print(allRating) #uncomment this command to make sure it worked, if that seems necessary

#lab step #16: Access third row of matrix from step #10 (allRating)
allRating[3,]

#lab step #17: Access the fourth column of the data frame from step #12 (vectorDataFrame)
vectorDataFrame[,4]

#lab step #18: Access my ranking for episode V.