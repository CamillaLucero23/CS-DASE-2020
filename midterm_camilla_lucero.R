#Q1

install.packages("nycflights13")
library(dplyr)

flightsDataSet = nycflights13::flights #Import flights into variable for referencing
View(flightsDataSet)

#filter out all flights that had departure delays of 12 or more hours 
#and arrival delays of 18 hours or more
delayedFlightsData = filter(flightsDataSet, dep_delay >= 12*60 & arr_delay >= 18*60)
View(delayedFlightsData)#results

#filter out all flights that departed in the Summer (July, Aug, Sept) that are operated
#by JetBlue ("B6") that flew from JFK to MIA or BQN
jetBlueFlightsData = filter(flightsDataSet, 7 <= month & month <=9 ) # Get month
jetBlueFlightsData = filter(jetBlueFlightsData, carrier == "B6") # Get carrier
jetBlueFlightsData = filter(jetBlueFlightsData, origin == "JFK" & dest == "MIA" 
                            | dest == "BQN") #get origin & destination
View(jetBlueFlightsData)#Results.

#write a script, using select() function, to select subset of data that
#include all columns but the following:  distance, hour, minute, time_hour
excludedColumnsData = select(flightsDataSet, !c(distance, hour, minute, time_hour))
View(excludedColumnsData)#results

#write a script, using mutate() function, to add a new column representing flight 
#operation costs. In here, the cost of operation for each flight is considered as 
#the sum of air-time cost ($5 per hour of air time) and fly distance cost 
#($3 per mile traveled)
flightDataAddOperationCost = mutate(flightsDataSet, 
                                    oper_cost = (5 * air_time) + (3 * distance))
View(flightDataAddOperationCost)#results

#write a script that calculates the correlation between every numerical 
#column in flights dataset. 
numericalFlightData = select(flightsDataSet, !c(carrier, tailnum, origin, 
                                                dest, time_hour))
#omit non-numerical data...
numericalFlightData = na.omit(numericalFlightData)# omit NA's
flightDataCorrelations = cor(numericalFlightData)# Create Correlations
View(flightDataCorrelations)

#------------------------------------------------------------------------------------
#Q2

#In each normal distribution below, mean is 1150 and standard deviation 105,
#find the indicated value of x
mean = 1150
stdev = 105

#Graph 1 A = 0.6
question2_1X = qnorm(0.6,mean,stdev)
print(question2_1X) # = 1176.601

#Graph 2, A = 0.8
question2_2x = qnorm(0.8, mean, stdev,lower.tail = FALSE)
print(question2_2x) # = 1061.63

#Graph 3, A = 0.95
question2_3X = qnorm(0.95, mean, stdev,lower.tail= FALSE)
print(question2_3X) # = 977.2904

#Graph 4, A = 0.99
question2_4x = qnorm(0.99, mean, stdev)
print(question2_4x) # = 1394.297


#------------------------------------------------------------------------------------
#Q3
#Find the shaded area in the following with the assumption that sample mean is 105 
#and standard deviation is 10.
mean = 105
stdev = 10

#Graph 1, shaded = 120
question3_1sh = pnorm(120,mean, stdev)
print(question3_1sh)# = 0.9331928

#Graph 2, shaded = 80
question3_2sh = pnorm(80,mean, stdev, lower.tail = FALSE)
print(question3_2sh)# = 0.9937903

#Graph 3, shaded = between 90 and 115
upperBoundShaded = pnorm(115,mean, stdev)
lowerBoundShaded = pnorm(90,mean, stdev)

question3_3sh = upperBoundShaded - lowerBoundShaded
print(question3_3sh) # = 0.7745375


#Graph 4, shaded = between 75 and 110
upperBoundShaded = pnorm(110,mean, stdev)
lowerBoundShaded = pnorm(75,mean, stdev)

question3_4sh = upperBoundShaded - lowerBoundShaded
print(question3_4sh) # = 0.6901126