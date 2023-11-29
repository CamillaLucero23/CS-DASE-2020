#Question 1 - 
#a) Null Hypothesis (H0) - There is no difference from the dispensed amount of sugar verses
#   the designated recipe.
#   Alt. Hypothesis (H1) - There is significant difference from the dispensed amount of sugar verses
#   the designated recipe.

#b) The One-Sample t-test is the best to use in this case since we have one set of data and 
#   a single variable to compare the data set to. 

#c)
#Intialize Drink_sugar
Drink_sugar = c(9.976959, 10.012098, 9.963002, 9.998574, 10.002431, 10.036959,
               10.014752, 9.985491, 10.026681, 9.981070, 10.011058, 9.958206,
               10.047110, 9.931327, 9.980533, 9.982266, 9.956010, 9.992339,
               9.957293, 9.907988, 9.983450, 10.018341, 9.979281, 9.931443,
               10.019777)

#Initialize the intented sugar amount
correctSugarAmount = 10

#Conduct one-sample t-test where Drink_sugar is the data set from 25 made drinks and 
#mu, or our mean value to be compared to, is the correct sugar amount of 10
oneSampleTestDrink =t.test(Drink_sugar,mu = correctSugarAmount)

#report results...
print(oneSampleTestDrink)

#since the p value is ever so slightly bigger than 0.05, we cannot reject our null hypothesis.
#therefore, there is no significant difference between the sugar dispensed and the intended value
#-------------------------------------------------------------------------------------------------------
#Question 2 
#c)

#initialize the data from before and after...
Daily_Sale_Before_Discount_Program = c (49971.98, 49988.49, 50077.94, 50003.53, 50006.46, 50085.75, 50023.05)
Daily_Sale_After_Discount_Program = c(50011.75, 50040.66, 50052.72, 50136.20, 50092.99, 50095.04, 50080.53)

#Do the test with our data samples, making sure that paired is set to true
pairedSampleTestDiscounts = t.test(Daily_Sale_Before_Discount_Program,Daily_Sale_After_Discount_Program, paired = TRUE)
print(pairedSampleTestDiscounts)
