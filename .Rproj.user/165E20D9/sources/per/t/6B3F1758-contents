#Q1. Assume you want to conduct an experiment to know if reposes to question about
#relation between global warming and current heat wave in US is influenced by
#participants’ gender. Your participants will give their answers as “strongly agree”,
#“agree”, “no opinion”, “disagree”, “strongly disagree”

#A. You would use the chi-test due to how it compares the relationship between gender and 
#global warming.

#B. There is significant relationship between global warming and gender. 

#C. Null Hypothesis (H0) - There is no relationship between global warming and the 
#   current heat wave in the US and the participant's gender.

#   Alternative Hypothesis (Ha) - There is some relationship between global warming and 
#                                 gender. 

#D. Find Degrees of Freedom...
genders = 2 #we will only use 2 genders for this 
numOptions = 5 #the number of possible options for participants to choose from
df = (numOptions - 1) * (genders - 1) #df = 4

#E. Find critical values at α =.01 and α = .05.
value1 = .01
value2 = .05
critVal1 = qchisq(1 - value1, df) # critVal1 = 13.277
critVal2 = qchisq(1 - value2, df) # critVal2 = 9.488
#----------------------------------------------------------------------------------------------
#Q2. Find the critical value for 𝜒2 test with 5 degrees of freedom and significance level of
#α = .15
df = 5
value3 = .15
critVal3 = qchisq(1 - value3, df) # critVal3 = 8.115

#----------------------------------------------------------------------------------------------
#Q3. Assume you have following information about voting population in a small city with
#their breakdown on gender and party.
data = matrix(c(4084, 7062, 2391, 3207, 2433, 1468), nrow = 2, ncol = 3)
rownames(data) = c("F", "M")
colnames(data) = c("Democrat", "Independent", "Republican")

#A. 
