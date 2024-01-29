#Q1 - 
#A. Write a script to perform linear regression and report the results of analysis, explain your
#   findings

# Load the dataset
mechanicData = MData.Salary

# Linear regression
mechanicLinearRegModel = lm(formula= salary ~ sex + Specialization + yrs.with.license + yrs.working + Licence.type, data = mechanicData)

# Summary of the regression & Plot
summary(mechanicLinearRegModel)
x = mechanicLinearRegModel$residuals
y = mechanicData$salary

plot(x, y, main= "Salary vs Residuals", ylab= "Salary", xlab= "Residuals")

#Since the p-value of our F-statistic is <2.2e-16, then we can conclude that one of our predictor
#values is significant with our salary. Notably, looking at our t-statistic p-value in the 
#coefficients table, these values are our male, electronic specialization, and license type B statistics.
#Focusing on our sex coefficients, our p-value for males is significantly closer to 0 and so we can conclude
#that gender has a great affect on the salary of the worker.

#B. Write a script to perform hypothesis testing for all pairwise correlations, explain your
#   findings

# Hypothesis testing for pairwise correlations
install.packages("lsr") #install just in case
library(lsr)

#Fix character values
genderMap = c("Male" = 1, "Female" = 2)
licenseMap = c("A" = 1, "B" = 2)
specMap = c("Electronics" = 1, "Engine" = 2, "Body" = 3)

mechanicData$sex = match(mechanicData$sex, names(genderMap))
mechanicData$Licence.type = match(mechanicData$Licence.type, names(licenseMap))
mechanicData$Specialization = match(mechanicData$Specialization, names(specMap))

#correlate & print
correlate(mechanicData, test=TRUE)

# the hypothesis testing has concluded that there is a significant correlation between yrs working,
# yrs with a license, and specialization with salary. This lines up with our linear regression model, 
# suggesting that years working, having a license, and specializing in certain things potentially correlates more
# than sex/gender.
#----------------------------------------------------------------------------------------------------------------
#Q2
#A. Write a script to perform appropriate analysis to reveal any relationship between
#   following factors and elaborate on findings
#     a.1) the drug administered and participants’ gender
#     a.2) the drug administered and the drug’s effectiveness scale
#     a.3) the participants’ gender and the drug’s effectiveness scale

# Load the necessary library
library(tidyr)
library(dplyr)
library(stats)

# Load the dataset
alzheimerData = Alzheimer

#Fix variables
medicineMap = c('A' = 1, 'B' = 2, 'C' = 3)
genderMap = c('m' = 1, 'f' = 2)
alzheimerData$DrugType= match(alzheimerData$DrugType, names(medicineMap))
alzheimerData$Gender= match(alzheimerData$Gender, names(genderMap))

# a.1) Relationship between drug administered and participants' gender
drugVsGender = aov(alzheimerData$Gender ~ alzheimerData$DrugType)
summary(drugVsGender) #strong significance

# a.2) Relationship between drug administered and drug's effectiveness scale
drugVsEffect = aov(alzheimerData$DrugType ~ alzheimerData$EffectivenessScale)
summary(drugVsEffect) #Strong significance

# a.3) Relationship between participants' gender and drug's effectiveness scale
genderVsEffect = aov(alzheimerData$Gender ~ alzheimerData$EffectivenessScale)
summary(genderVsEffect) #No significance

#B. Bonus Credit: 10 marks: use two-way anova to examine the relation between
#     b.1) the type of drug administered and participants’ genders on drug effectiveness scale.
#     b.2) the relations considered in b.1 and the combined effect of the drug administered and
#          participants’ genders on drug effectiveness scale.

# b.1) Two-way ANOVA for the type of drug administered and participants' genders on drug effectiveness scale
modelb1 <- aov(EffectivenessScale ~ DrugType + Gender, data=alzheimerData)
summary(modelb1) #Some significance

# b.2) Two-way ANOVA for the combined effect of the drug administered and participants' genders on drug effectiveness scale
modelb2 <- aov(EffectivenessScale ~ DrugType * Gender, data=alzheimerData)
summary(modelb2) #some significance
