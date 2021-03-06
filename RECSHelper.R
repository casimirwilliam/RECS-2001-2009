#Helper functions for RECS recoding

library(plyr)

#Convert to TRUE and FALSE with options on NA treatment
#column is a column in the data frame
#na.action is either KEEP means to code as NA, TRUE means convert to TRUE, or FALSE means convert to FALSE
#na.key is the indicator used to indicate that an observation is missing. 
#output is a column for a dataframe


to.TF <-function(column, na.choice, na.key=-2){
  if(na.choice=="KEEP") column[column==na.key]<-NA 
  if(na.choice=="TRUE") column[column==na.key]<-TRUE 
  if(na.choice=="FALSE") column[column==na.key]<-FALSE 
  
  as.logical(revalue(as.factor(column),c("0"=FALSE, "1"=TRUE)))
}

# #Example Code
# summary(All2009$CENACHP)
# 
# summary(to.TF(All2009$CENACHP, na.choice="KEEP"))
# summary(to.TF(All2009$CENACHP, na.choice="FALSE"))
# summary(to.TF(All2009$CENACHP, na.choice="TRUE"))


# Change the real valued columns with an numeric na code to real NA
# Default NA indicator is -2
# output is a column for a dataframe
fix.na<-function(column, na.key=-2){
  column[column==na.key]<-NA
  column
}
  

# #Example Code
# summary(All2009$NUMBERAC)
# summary(fix.na(All2009$NUMBERAC))


# General Recode.  Keystroke saver
# column is a datafram
# key is a c in the format used for revalue
recode<-function(column, key){
  revalue(as.factor(column),key)
}


# Example Code
# summary(revalue(as.factor(All2009$ESWWAC),c("0"=TRUE, "1"=FALSE, "-2"=FALSE, "-8"=FALSE, "-9"=FALSE)))
# summary(All2009$ESWWAC)
# 
summary(recode(All2009$ESWWAC,c("0"=TRUE, "1"=FALSE, "-2"=FALSE, "-8"=FALSE, "-9"=FALSE)))


#Common Recodes
# Best to define this at the top an then use them so you are less likely to make errors

FuelType<-c("1"="NG","2"="LPG", "3"="FuelOil","4"="Kerosene", "5"="Elec","8"="Solar","21"="Other", "-2"=NA)

# Example
# summary(recode(All2009$FUELPOOL,FuelType))


