#Q1. Assume you want to conduct an experiment to know if reposes to question about
#relation between global warming and current heat wave in US is influenced by
#participants’ gender. Your participants will give their answers as “strongly agree”,
#“agree”, “no opinion”, “disagree”, “strongly disagree”

#A. You would use the chi-squared test of independence due to how it compares the relationship between gender and 
#global warming.

#B. There is significant relationship between global warming and gender. 

#C. Null Hypothesis (H0) - There is no relationship between global warming and the 
#   current heat wave in the US and the participant's gender.

#   Alternative Hypothesis (H1) - There is some relationship between global warming and 
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

#A. Null Hypoth. (H0) - there is no significant association between gender and political affiliation,
#   Alt. Hypoth. (H1) - There is a significant association between gender and politcal affliation. 

#B. Return the results of chi-square test in a variable X2stat and prints X-square statistics, 
#   df, and p value

x2stat = chisq.test(data)
View(x2stat)

print(x2stat) #I've found that, when printed this way, the summary abbreviates the p-value
#statistic = 780.317
#df = 2
#p.value =  3.599613e-170 | this is the true value, but the summary prints < 2.2e-16

#C. Explain what does “observed”, “expected”, “residuals”, and “stdres” fields in
#   X2stat represent
print(x2stat$observed) 
print(x2stat$expected)
print(x2stat$residuals)
print(x2stat$stdres)
# Observed - Observed frequencies in the data or the actual count.
# Expected - Expected frequencies in th data or what is expected if there is no association.
# Residuals - Differences between the expected and observed. Positive is where  observed is greater
#             than expected, negative is where expected is greater than observed. 
# stdres - Standard residuals where the residuals are divided by the standard deviation errors. Larger
#          values may indicate greater association. 

#D. The results would be, once comparing the p.value to 0.05 or 5%, which is a very small value, much 
#   smaller than 0.05, so we can reject the null hypothesis and state that there is a significant association
#   between gender and party affiliation. 
       
       