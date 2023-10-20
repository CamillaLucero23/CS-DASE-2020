install.packages("nycflights13")
library(dplyr)

flightsDataSet = nycflights13::flights #Import flights into variable for referencing
View(flightsDataSet)

#filter out all flights that had departure delays of 12 or more hours 
#and arrival delays of 18 hours or more
delayedFlightsData = filter(flightsDataSet, dep_delay >= 12 | arr_delay >= 18)

#filter out all flights that departed in the Summer (July, Aug, Sept) that are operated
#by JetBlue ("B6") that flew from JFK to MIA or BQN
jetBlueFlightsData = filter(flightsDataSet, 7 <= month & month <=9 ) # Get month
jetBlueFlightsData = filter(jetBlueFlightsData, carrier == "B6") # Get carrier
jetBlueFlightsData = filter(jetBlueFlightsData, origin == "JFK" & dest == "MIA" 
                            | dest == "BQN") #get origin & destination

#write a script, using select() function, to select subset of data that
#include all columns but the following:  distance, hour, minute, time_hour
excludedColumnsData = select(flightsDataSet, !c(distance, hour, minute, time_hour))

#write a script, using mutate() function, to add a new column representing flight 
#operation costs. In here, the cost of operation for each flight is considered as 
#the sum of air-time cost ($5 per hour of air time) and fly distance cost 
#($3 per mile traveled)
flightDataAddOperationCost = mutate(flightsDataSet, 
                                    oper_cost = (5 * air_time) + (3 * distance))

#write a script that calculates the correlation between every numerical 
#column in flights dataset. 
numericalFlightData = select(flightsDataSet, !c(carrier, tailnum, origin, 
                                                dest, time_hour))
#omit non-numerical data...
numericalFlightData = na.omit(numericalFlightData)# omit NA's
flightDataCorrelations = cor(x = numericalFlightData, )# Create Correlations


