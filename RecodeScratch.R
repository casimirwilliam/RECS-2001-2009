RECS$DOEID<-as.factor(RECS$DOEID)  

#Region
RECS$REGIONC<-revalue(as.factor(RECS$REGIONC),c("1"="NE", "2"="MidWest","3"="South","4"="West"))

#Type of Structure
RECS$TYPEHUQ<-revalue(as.factor(RECS$TYPEHUQ), c("1"="Mobile", "2"="SFDetached", "3"="SFAttached", "4"="SmApartment", "5"="LgApartment"))

#Climate zone
RECS$Climate_Region_Pub<-revalue(as.factor(RECS$Climate_Region_Pub),c("1"="VColdCold","2"="HotDryMixedDry","3"="HotHumid","4"="MixedHumid","5"="Marine"))

#Urban vs Rural
RECS$UR<-revalue(as.factor(RECS$UR), c("U"="Urban","R"="Rural"))

RECS$KOWNRENT<-revalue(as.factor(RECS$KOWNRENT),c("1"="Own","2"="Rent","3"="Free"))

#Year Built
summary(RECS$YEARMADE)

#Moved in
RECS$OCCUPYYRANGE<-revalue(as.factor(RECS$OCCUPYYRANGE),c("1"="Pre50", "2"="5059","3"="6069","4"="7079","5"="8089","6"="9099", "7"="0004","8"="0509"))

#Bedrooms
RECS$BEDROOMS[RECS$BEDROOMS==-2]<-NA
summary(RECS$BEDROOMS)

#Working with cooking end use
summary(RECS$STOVEN)
summary(RECS$STOVE)
summary(RECS$OVEN)
#Stove and oven fuel are only reported if separate

RECS$CookTopElectric<-FALSE
RECS$CookTopElectric[RECS$STOVENFUEL=='5' | RECS$STOVEFUEL=='5' ]<-TRUE

RECS$OvenElectric<-FALSE
RECS$OvenElectric[RECS$STOVENFUEL=='5' | RECS$OVENFUEL=='5' ]<-TRUE

#Just indicating that that cook with electricity
summary(RECS$CookTopElectric)
summary(RECS$OvenElectric)

#How much they use it
RECS$NUMMEAL<-revalue(as.factor(RECS$NUMMEAL),c("0"="Never","1"="ThreeDay","2"="TwoDay", "3"="OneDay", "4"="FewWeek","5"="OneWeek","6"="LessWeek"))

#this is better on cooking fuel.  Don't use the separate oven and cook top from above
RECS$ELectricCook<-FALSE
RECS$ELectricCook[RECS$FUELFOOD=="5"]<-TRUE

#Number of fridges.  Watch out for those with more than 4.
table(RECS$NUMFRIG)

#age of fridge
RECS$AgeFridge<-revalue(as.factor(RECS$AGERFRI1), c("1"="Less2", "2"="2to4Years", "3"="5to9Years","41"="10to14Years","42"="15to19Years","5"="20PlusYears","-2"=NA))

summary(RECS$AgeFridge)

#Has Dishwasher
RECS$DishwaherTrue<-revalue(as.factor(RECS$DISHWASH),c("0"=TRUE, "1"=FALSE))

RECS$WASHLOAD<-revalue(as.factor(RECS$WASHLOAD),c("1"="1Less","2"="2to4Loads","3"="5to9Loads","4"="10to15Loads","5"="15PlusLoads","-2"=NA))

RECS$DRYER<-revalue(as.factor(RECS$DRYER), c("0"=FALSE,"1"=TRUE))

RECS$DRYRFUEL<-revalue(as.factor(RECS$DRYRFUEL), c("1"="NG","2"="LPG","5"="Elec","-2"=NA))

##Start Recoding HERE

#Age of Dryer
AGECDRYER<-revalue(as.factor(RECS$AGECDRYER),c("1"="Less2","2"="TwoTo4", "3"="FiveTo9", "41"="TenTo14", "42"="FifteenTo19", "5"="Gr20", "-2"=NA))
summary(RECS$AGECDRYER)

#Number of TVs
summary(RECS$TVCOLOR)

#Type of TV 
RECS$TVTYPE1<-revalue(as.factor(RECS$TVTYPE1),c("1"="Standard","2"="LCD", "3"="Plasma", "4"="Projection", "5"="LED", "-2"=NA))

summary(RECS$TVTYPE1)

#Weekday Use of TV
RECS$TVONWD1<-revalue(as.factor(RECS$TVONWD1),c("1"="LessHour","2"="OneTo3Hrs", "3"="ThreeTo6Hrs", "4"="SixTo10Hrs", "5"="Gr10", "-2"=NA))

summary(RECS$TVONWD1)

#number of computers

summary(RECS$NUMPC)

#Time computers on
RECS$TIMEON1<-revalue(as.factor(RECS$TIMEON1),c("1"="LessHour","2"="OneTo3Hrs", "3"="ThreeTo6Hrs", "4"="SixTo10Hrs", "5"="Gr10", "-2"=NA))
summary(RECS$TIMEON1)


#Well Pump?
RECS$WELLPUMP<-revalue(as.factor(RECS$WELLPUMP),c("0"=FALSE,"1"=TRUE, "-2"=FALSE))
summary(RECS$WELLPUMP)

#Heating Fuel
RECS$FUELHEAT<-revalue(as.factor(RECS$FUELHEAT),c("1"="NG","2"="LPG","3"="Oil", "4"="Kerosene", "5"="Elec", "7"="Wood", "8"="Solar", "9"="District", "21"="Other", "-2"=NA))

summary(RECS$FUELHEAT)

#Heating Age
RECS$EQUIPAGE<-revalue(as.factor(RECS$EQUIPAGE),c("1"="Less2","2"="TwoTo4", "3"="FiveTo9", "41"="TenTo14", "42"="FifteenTo19", "5"="Gr20", "-2"=NA))
summary(RECS$EQUIPAGE)


#Winter Temp Day when home
RECS$TEMPHOME[RECS$TEMPHOME==-2]<-NA
summary(RECS$TEMPHOME)

#Winter Temp Day when away
RECS$TEMPGONE[RECS$TEMPGONE==-2]<-NA
summary(RECS$TEMPGONE)

#Winter Temp at Night
RECS$TEMPNITE[RECS$TEMPNITE==-2]<-NA
summary(RECS$TEMPNITE)

#Water heater type
RECS$H2OTYPE1<-revalue(as.factor(RECS$H2OTYPE1),c("1"="Storage", "2"="Tankless", "-2"=NA))

summary(RECS$H2OTYPE1)

#Water service fuel
RECS$FUELH2O<-revalue(as.factor(RECS$FUELH2O),c("1"="NG","2"="LPG","3"="Oil", "4"="Kerosene", "5"="Elec", "7"="Wood", "8"="Solar", "9"="District", "21"="Other", "-2"=NA))

summary(RECS$FUELH2O)

#Water heater size.  Keep in mind the tankless.
RECS$WHEATSIZ<-revalue(as.factor(RECS$WHEATSIZ),c("1"="Small", "2"="Med", "3"="Lrg", "-2"=NA))

summary(RECS$WHEATSIZ)

#Water heater age
RECS$WHEATAGE<-revalue(as.factor(RECS$WHEATAGE),c("1"="Less2","2"="TwoTo4", "3"="FiveTo9", "41"="TenTo14", "42"="FifteenTo19", "5"="Gr20", "-2"=NA))

summary(RECS$WHEATAGE)

#AC is used?
RECS$AIRCOND<-revalue(as.factor(RECS$AIRCOND),c("0"=FALSE, "1"=TRUE))
summary(RECS$AIRCOND)

#AC Type
RECS$COOLTYPE<-revalue(as.factor(RECS$COOLTYPE),c("1"="Central", "2"="Window", "3"="Both", "-2"=NA))
summary(RECS$COOLTYPE)

#Central AC is heatpump.  Remember only Central AC
RECS$CENACHP<-revalue(as.factor(RECS$CENACHP),c("0"=FALSE, "1"=TRUE, "-2"=NA))
summary(RECS$CENACHP)

#Age Central AC
RECS$AGECENAC<-revalue(as.factor(RECS$AGECENAC),c("1"="Less2","2"="TwoTo4", "3"="FiveTo9", "41"="TenTo14", "42"="FifteenTo19", "5"="Gr20", "-2"=NA))

summary(RECS$AGECENAC)


#Use Central AC?
RECS$USECENAC<-revalue(as.factor(RECS$USECENAC),c("1"="Rare","2"="Frequent", "3"="All", "-2"=NA))
summary(RECS$USECENAC)

#Temp AC when home in day
RECS$TEMPHOMEAC[RECS$TEMPHOMEAC=="-2"]<-NA
summary(RECS$TEMPHOMEAC)


#Temp AC no home in day
RECS$TEMPGONEAC[RECS$TEMPGONEAC==-2]<-NA
summary(RECS$TEMPGONEAC)

#Temp AC at night
RECS$TEMPNITEAC[RECS$TEMPNITEAC==-2]<-NA
summary(RECS$TEMPNITEAC)

#Number of wall AC units
RECS$NUMBERAC[RECS$NUMBERAC==-2]<-NA
summary(RECS$NUMBERAC)


#age of wall AC
RECS$WWACAGE<-revalue(as.factor(RECS$WWACAGE),c("1"="Less2","2"="TwoTo4", "3"="FiveTo9", "41"="TenTo14", "42"="FifteenTo19", "5"="Gr20", "-2"=NA))
summary(RECS$WWACAGE)

#Wall AC is energy Star?
RECS$ESWWAC<-revalue(as.factor(RECS$ESWWAC),c("0"=TRUE, "1"=FALSE, "-2"=FALSE, "-8"=FALSE, "-9"=FALSE))
summary(RECS$ESWWAC)

#How frequent wall ac
RECS$USEWWAC<-revalue(as.factor(RECS$USEWWAC),c("1"="Rare","2"="Frequent", "3"="All", "-2"=NA))
summary(RECS$USEWWAC)

#Have pool?
RECS$SWIMPOOL<-revalue(as.factor(RECS$SWIMPOOL),c("0"=FALSE,"1"=TRUE, "-2"=FALSE))
summary(RECS$SWIMPOOL)

#Pool heated?
RECS$POOL<-revalue(as.factor(RECS$POOL),c("0"=FALSE,"1"=TRUE, "-2"=FALSE))

summary(RECS$POOL)

#Fuel used for pool
RECS$FUELPOOL<-revalue(as.factor(RECS$FUELPOOL),c("1"="NG","2"="LPG", "3"="FuelOil","4"="Kerosene", "5"="Elec","8"="Solar","21"="Other", "-2"=NA))
summary(RECS$FUELPOOL)

#Hot Tub used
RECS$RECBATH<-revalue(as.factor(RECS$RECBATH),c("0"=FALSE,"1"=TRUE))
summary(RECS$RECBATH)

#Hot tub fuel
RECS$FUELTUB<-revalue(as.factor(RECS$FUELTUB),c("1"="NG","2"="LPG", "3"="FuelOil","4"="Kerosene", "5"="Elec","8"="Solar","21"="Other", "-2"=NA))
summary(RECS$FUELTUB)

RECS$TYPEGLASS<-revalue(as.factor(RECS$TYPEGLASS),c("1"="SinglePane","2"="DoublePane", "3"="TriplePane", "-2"=NA))
summary(RECS$TYPEGLASS)

#Electricity used for cooling
RECS$ELCOOL<-revalue(as.factor(RECS$ELCOOL),c("0"=FALSE,"1"=TRUE))
summary(RECS$ELCOOL)

#Electricity used for space heating
RECS$ELWARM<-revalue(as.factor(RECS$ELWARM),c("0"=FALSE,"1"=TRUE))
summary(RECS$ELWARM)

#Electricity used for water heating
RECS$ELWATER<-revalue(as.factor(RECS$ELWATER),c("0"=FALSE,"1"=TRUE))
summary(RECS$ELWATER)

#Electricity used for cooking
RECS$ELFOOD<-revalue(as.factor(RECS$ELFOOD),c("0"=FALSE,"1"=TRUE))
summary(RECS$ELFOOD)

#May need to do some editing on this.  Low values are too low
summary(RECS$KWH)/12

#This is the sqft variable to use
summary(RECS$TOTSQFT_EN)

#Get income working two ways
#MONEYPY 
RECS$MONEYPY<-revalue(as.factor(RECS$MONEYPY),c("1"="Less2500", "2"="Less5K", "3"="Less7500","4"="Less10K","5"="Less15K","6"="Less20K","7"="Less25K","8"="Less30K", "9"="Less35K","10"="Less40K","11"="Less45K","12"="Less50K","13"="Less55K","14"="Less60","15"="Less65","16"="Less70","17"="Less75","18"="Less80", "19"="Less85", "20"="Less90","21"="Less95","22"="Less100K","23"="Less120K","24"="Gr120K"))
summary(RECS$MONEYPY)


RECS$RENTHELP<-revalue(as.factor(RECS$RENTHELP),c("0"=FALSE, "1"=TRUE, "-2"=FALSE))
summary(RECS$RENTHELP)

RECS$FOODASST<-revalue(as.factor(RECS$FOODASST),c("0"=FALSE, "1"=TRUE))
summary(RECS$FOODASST)

#Age of HH looks ok
summary(RECS$HHAGE)

#number of people
summary(RECS$NHSLDMEM)

#Ed level of HH
RECS$EDUCATION<-revalue(as.factor(RECS$EDUCATION),c("0"="None","1"="NoHS","2"="HS","3"="SomeCol","4"="AA","5"="BA", "6"="MA", "7"="Prof", "8"="PHD"))
summary(RECS$EDUCATION)


#HH Race
RECS$Householder_Race<-revalue(as.factor(RECS$Householder_Race),c("1"="Wt","2"="AfAm","3"="NativeAm","4"="Asian","5"="Pacific", "6"="Other", "7"="Multi"))
summary(RECS$Householder_Race)

#Hispanic
RECS$Hispanic<-FALSE
RECS$Hispanic[RECS$SDESCENT=="1"]<-TRUE
summary(RECS$Hispanic)

summary(RECS$HDD65)
summary(RECS$CDD65)

RECS$ElecMeals<-RECS$NUMMEAL
levels(RECS$ElecMeals)<-c(levels(RECS$ElecMeals),"NoElec")
RECS$ElecMeals[RECS$ELectricCook==FALSE]<-"NoElec"
RECS$ElecMeals<-relevel(RECS$ElecMeals, "NoElec")

RECS$ElecWater<-RECS$WHEATSIZ
levels(RECS$ElecWater)<-c(levels(RECS$ElecWater),"Tankless","NoElec")
RECS$ElecWater[RECS$H2OTYPE1=="Tankless"]<-"Tankless"
RECS$ElecWater[RECS$FUELH2O!="Elec"]<-"NoElec"
RECS$ElecWater<-relevel(RECS$ElecWater, "NoElec")

RECS$ElecPool<-FALSE
RECS$ElecPool[RECS$SWIMPOOL==TRUE & RECS$FUELPOOL=="Elec"]<-TRUE
RECS$ElecTub<-FALSE
RECS$ElecTub[RECS$RECBATH==TRUE & RECS$FUELTUB=="Elec"]<-TRUE
summary(RECS$MONEYPY)
library(plyr)
IncomeTopCode<-150000

RECS$Income<-as.numeric(as.character(revalue(RECS$MONEYPY,c("Less2500"=1250, "Less5K"=3750, "Less7500"=6250,"Less10K"=8750,"Less15K"=12500,"Less20K"=17500,"Less25K"=22500,"Less30K"=27500, "Less35K"=32500,"Less40K"=37500,"Less45K"=42500,"Less50K"=47500,"Less55K"=52500,"Less60"=57500,"Less65"=62500,"Less70"=67500,"Less75"=72500,"Less80"=77500, "Less85"=82500, "Less90"=87500,"Less95"=92500,"Less100K"=97500,"Less120K"=110000,"Gr120K"=IncomeTopCode))))

#Setting left out to wt non-hispanic
RECS$Householder_Race<-relevel(RECS$Householder_Race,"Wt")

#Combine race and ethnicity

RECS$EthRace<-factor(paste(as.character(RECS$Hispanic),as.character(RECS$Householder_Race),sep = ""))

RECS$EthRace<-relevel(RECS$EthRace,"FALSEWt")

#Combine structure and tenure

RECS$StrTenure<-factor(paste(as.character(RECS$KOWNRENT),as.character(RECS$TYPEHUQ),sep=""))

RECS$StrTenure<-relevel(RECS$StrTenure,"OwnSFDetached")

summary(lm(KWH~StrTenure:TOTSQFT_EN:HDD65+StrTenure:TOTSQFT_EN:CDD65 
           + ElecMeals
           + NUMFRIG+AgeFridge
           + TVONWD1:TVTYPE1
           + NUMPC+TIMEON1
           + WELLPUMP
           + ElecWater
           + SWIMPOOL + ElecPool
           + RECBATH +ElecTub
           + TYPEGLASS:TOTSQFT_EN
           + NHSLDMEM
           + Income+EthRace:Income, 
           data=RECS[RECS$KOWNRENT!="Free" & RECS$NWEIGHT<40000 & RECS$NUMFRIG<5,],weights=NWEIGHT))

