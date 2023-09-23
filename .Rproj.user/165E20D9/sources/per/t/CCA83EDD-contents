#initialize auto variable that points to dataset
auto = Auto

#find type of auto
typeof(auto) #"list"

#find class of auto
class(auto) #"data.frame"

#Initial Dimensions of Auto data set
dim(auto) #"397 rows, 9 columns"

#omit non applicable data and display dimensions again
auto = na.omit(auto)#omit any na's
dim(auto) #"397 rows, 9 columns" Whatever data that was N/A did not occupy
             # an entire row, so everything stays the same.

#displays names of all variables in auto
names(auto) #"[1] "mpg"          "cylinders"    "displacement" "horsepower"  
            # [5] "weight"       "acceleration" "year"         "origin"   
            # [9]"name"

#Access Auto without invoking a function
attach(Auto) #The following objects are masked from auto:

                #acceleration, cylinders, displacement, horsepower, mpg,
                #name, origin, weight, year


#plot initial values
plot(cylinders, mpg) 

#convert cylinder to factor
cylindersAsFactor = as.factor(cylinders)

#plot again
plot(cylindersAsFactor, mpg, col = "green", xlab = "Cylinders", ylab = "MPG" )

#generate histogram of mpg
hist(mpg,col = "green", breaks = 10)

#generate pairs
horsepowerEdit = as.double(horsepower) #convert horsepower since it does have characters

infoForPairs = data.frame( mpg, displacement, acceleration, horsepowerEdit , weight)
pairs(infoForPairs)

#Display Descriptive Stats.
summary(Auto)




