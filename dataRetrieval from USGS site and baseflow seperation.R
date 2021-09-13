#it needs "dataRetieval" package to be installed in RStudio
#dateTime column is converted to UTC (Coordinated Universal Time). It needs to be override in expected timezone


#Common USGS Parameter Codes: "00060"	shortName= "Discharge [ft3/s]"
library(parallel)
library(EcoHydRology)
library(dataRetrieval)
library(ggplot2)
library(dplyr)


##################################################################################################################
                                          #U01 - 06719840 -	Little Dry Creek - Westminster#
##################################################################################################################

siteNumber <- "06719840"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-28" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U01-06719840_Little Dry Creek_Westminster.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U01-06719840_Little Dry Creek_Westminster",
     type ="l", col="black", log='y', ylim = c(1,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim=c(1,y.max))

dev.off()



##################################################################################################################
                                       #U02 - 06719845	- Little Dry Creek - Federal
##################################################################################################################


siteNumber <- "06719845"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U02-06719845_Little Dry Creek_Federal.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U02-06719845_Little Dry Creek_Federal",
     type ="l", col="black", log='y', ylim = c(1,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(1,y.max))

dev.off()




##################################################################################################################
                                       #U03	06719560	Lena Gulch - Lakewood
##################################################################################################################


siteNumber <- "06719560"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U03-06719560_Lena Gulch_Lakewood.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U03-06719560_Lena Gulch_Lakewood",
     type ="l", col="black", log='y', ylim = c(0.5,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(0.5,y.max))

dev.off()




##################################################################################################################
                                      #U04	06711770	Dry Gulch - Denver
##################################################################################################################


siteNumber <- "06711770"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U04-06711770_Dry Gulch-Denver.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U04-06711770_Dry Gulch-Denver",
     type ="l", col="black", log='y', ylim = c(0.5,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(0.5,y.max))

dev.off()



##################################################################################################################
                                   #U05	06711780	Lakewood Gulch - Denver
##################################################################################################################


siteNumber <- "06711780"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U05-06711780_Lakewood Gulch-Denver.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U05-06711780_Lakewood Gulch-Denver",
     type ="l", col="black", log='y', ylim = c(1,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(1,y.max))

dev.off()



##################################################################################################################
                                    #U06	06711618	Weir Gulch - Denver
##################################################################################################################


siteNumber <- "06711618"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U06-06711618_Weir Gulch - Denver.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U06-06711618_Weir Gulch - Denver",
     type ="l", col="black", log='y', ylim = c(0.1,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(0.1,y.max))

dev.off()



##################################################################################################################
                                      #U07	06711575	Harvard Gulch - Harvard Park
##################################################################################################################


siteNumber <- "06711575"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U07-06711575_Harvard Gulch - Harvard Park.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U07-06711575_Harvard Gulch - Harvard Park",
     type ="l", col="black", log='y', ylim = c(0.01,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(0.01,y.max))

dev.off()



##################################################################################################################
                               #U08	06711570	Harvard Gulch - Colorado
##################################################################################################################


siteNumber <- "06711570"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U08-06711570_Harvard Gulch - Colorado.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U08-06711570_Harvard Gulch - Colorado",
     type ="l", col="black", ylim = c(0.001,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(0.001,y.max))

dev.off()



##################################################################################################################
                                 #U09	06711555	Little Dry Creek - Englewood
##################################################################################################################


siteNumber <- "06711555"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U09-06711555_Little Dry Creek - Englewood.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U09-06711555_Little Dry Creek - Englewood",
     type ="l", col="black", log='y', ylim = c(1.0,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(1.0,y.max))

dev.off()


##################################################################################################################
                                     #U10	06709910	Dutch Creek - Littleton
##################################################################################################################


siteNumber <- "06709910"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U10-06709910_Dutch Creek - Littleton.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U10-06709910_Dutch Creek - Littleton",
     type ="l", col="black", log='y', ylim = c(1,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(1,y.max))

dev.off()



##################################################################################################################
                                     #U11	06709740	Lee Gulch - Littleton
##################################################################################################################


siteNumber <- "06709740"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-25" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U11-06709740_Lee Gulch - Littleton.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U11-06709740_Lee Gulch - Littleton",
     type ="l", col="black", ylim = c(0.01,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(0.01,y.max))

dev.off()



##################################################################################################################
                                    #U12	06711515	Little Dry Creek - Arapahoe
##################################################################################################################


siteNumber <- "06711515"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz="America/Denver")
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U12-06711515_Little Dry Creek - Arapahoe.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U12-06711515_Little Dry Creek - Arapahoe",
     type ="l", col="black", log='y', ylim = c(0.1,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(0.1,y.max))

dev.off()



##################################################################################################################
                                #U13	06710150	Big Dry Creek - Highlands Ranch
##################################################################################################################

siteNumber <- "06710150"
parameterCd <- "00060"  # Discharge
startDate <- "2021-07-15" 
endDate <- "" 
dischargeUnit <- readNWISuv(siteNumber, parameterCd, 
                            startDate, endDate, tz='America/Denver')
dischargeUnit <- renameNWISColumns(dischargeUnit)

#write.table(dischargeUnit, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/dischargeUnit.csv", row.names=F, sep=",")

###This will return a 2 column data frame with nrow = length of input streamflow data. The first column
###contains baseflow, while the second contains quickflow, both in the same units as the input

Q_Base <- BaseflowSeparation(dischargeUnit$Flow_Inst, filter_parameter = 0.99, passes = 3)

Q_Base$dateTime <- dischargeUnit$dateTime

#write.table(Q_Base, file="C:/Users/aaf1/My Drive/Al Fatta Bhaskar/R Works/Q_Base.csv", row.names=F, sep=",")

png(file = "U13-06710150_Big Dry Creek - Highlands Ranch.png")

y.max<- max(dischargeUnit$Flow_Inst, Q_Base$bt)

plot(x = Q_Base$dateTime,y = Q_Base$bt,
     xlab = "Time",
     ylab = "Discharge (cfs)",
     main = "U13-06710150_Big Dry Creek - Highlands Ranch",
     type ="l", col="black", log='y', ylim = c(0.5,y.max)
)

lines(x=dischargeUnit$dateTime, y=dischargeUnit$Flow_Inst, col="blue", ylim = c(0.5,y.max))

dev.off()





#################################################################################################################