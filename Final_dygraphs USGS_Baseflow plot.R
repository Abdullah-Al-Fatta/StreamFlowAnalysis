
#Load packages and set ggplot theme

library(ggplot2)
library(tidyverse)
library(lubridate)
library(scales)
library(dataRetrieval)
library(cowplot)
library(EcoHydRology)
library(xts)
library(dygraphs)


#################################################################################################################
                                          #Little Dry Creek-Westminister#
#################################################################################################################


#Import Data from Little Dry Creek-Westminister

dischargeUnit <- readNWISuv(
  site = "06719840",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Little Dry Creek-Westminister Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Little Dry Creek-Westminister"),

  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Little Dry Creek-Westminister",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(1, y.max)) %>%
  dyRangeSelector()



##################################################################################################################
                                 #U02 - 06719845	- Little Dry Creek - Federal
##################################################################################################################


#Import Data from Little Dry Creek - Federal

dischargeUnit <- readNWISuv(
  site = "06719845",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Little Dry Creek - Federal Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Little Dry Creek - Federal"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Little Dry Creek - Federal",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(1, y.max)) %>%
  dyRangeSelector()

##################################################################################################################
                                       #U03	06719560	Lena Gulch - Lakewood
##################################################################################################################

#Import Data from Lena Gulch - Lakewood

dischargeUnit <- readNWISuv(
  site = "06719560",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Lena Gulch - Lakewood Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Lena Gulch - Lakewood"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Lena Gulch - Lakewood",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(0.5, y.max)) %>%
  dyRangeSelector()


##################################################################################################################
                                     #U04	06711770	Dry Gulch - Denver
##################################################################################################################

#Import Data from Dry Gulch - Denver

dischargeUnit <- readNWISuv(
  site = "06711770",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Dry Gulch - Denver Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Dry Gulch - Denver"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Dry Gulch - Denver",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(0.2, y.max)) %>%
  dyRangeSelector()


##################################################################################################################
                               #U05	06711780	Lakewood Gulch - Denver
##################################################################################################################

#Import Data from Lakewood Gulch - Denver

dischargeUnit <- readNWISuv(
  site = "06711780",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Lakewood Gulch - Denver Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Lakewood Gulch - Denver"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.925, #The value recommended by Nathan and McMahon (1990) is 0.925
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Lakewood Gulch - Denver",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(1, y.max)) %>%
  dyRangeSelector()


##################################################################################################################
                                         #U06	06711618	Weir Gulch - Denver
##################################################################################################################

#Import Data from Weir Gulch - Denver

dischargeUnit <- readNWISuv(
  site = "06711618",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Weir Gulch - Denver Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Weir Gulch - Denver"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Weir Gulch - Denver",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(0.1, y.max)) %>%
  dyRangeSelector()

##################################################################################################################
                                   #U07	06711575	Harvard Gulch - Harvard Park
##################################################################################################################

#Import Data from Harvard Gulch - Harvard Park

dischargeUnit <- readNWISuv(
  site = "06711575",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Harvard Gulch - Harvard Park Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Harvard Gulch - Harvard Park"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Harvard Gulch - Harvard Park",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(0.02, y.max)) %>%
  dyRangeSelector()



##################################################################################################################
                                  #U08	06711570	Harvard Gulch - Colorado
##################################################################################################################


#Import Data from Harvard Gulch - Colorado

dischargeUnit <- readNWISuv(
  site = "06711570",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Harvard Gulch - Colorado Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Harvard Gulch - Colorado"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 100

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Harvard Gulch - Colorado",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", valueRange = c(0.001, y.max)) %>%
  dyRangeSelector()


##################################################################################################################
                                #U09	06711555	Little Dry Creek - Englewood
##################################################################################################################


#Import Data from Little Dry Creek - Englewood

dischargeUnit <- readNWISuv(
  site = "06711555",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Little Dry Creek - Englewood Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Little Dry Creek - Englewood"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Little Dry Creek - Englewood",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(1, y.max)) %>%
  dyRangeSelector()



##################################################################################################################
                                #U10	06709910	Dutch Creek - Littleton
##################################################################################################################

#Import Data from Little Dry Creek-Westminister

dischargeUnit <- readNWISuv(
  site = "06709910",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Dutch Creek - Littleton Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Dutch Creek - Littleton"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Dutch Creek - Littleton",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(1, y.max)) %>%
  dyRangeSelector()



##################################################################################################################
                                      #U11	06709740	Lee Gulch - Littleton
##################################################################################################################

#Import Data from Lee Gulch - Littleton

dischargeUnit <- readNWISuv(
  site = "06709740",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Lee Gulch - Littleton Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Lee Gulch - Littleton"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 5

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Lee Gulch - Littleton",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", valueRange = c(0.001, y.max)) %>%
  dyRangeSelector()




##################################################################################################################
                                     #U12	06711515	Little Dry Creek - Arapahoe
##################################################################################################################

#Import Data from Little Dry Creek - Arapahoe

dischargeUnit <- readNWISuv(
  site = "06711515",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Little Dry Creek - Arapahoe Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Little Dry Creek - Arapahoe"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Little Dry Creek - Arapahoe",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(0.1, y.max)) %>%
  dyRangeSelector()




##################################################################################################################
                               #U13	06710150	Big Dry Creek - Highlands Ranch
##################################################################################################################


#Import Data from Big Dry Creek - Highlands Ranch

dischargeUnit <- readNWISuv(
  site = "06710150",
  parameterCd = "00060",
  startDate = "2021-06-01", 
  endDate = "",
  tz="America/Denver"
) %>% 
  renameNWISColumns()

#Plot Big Dry Creek - Highlands Ranch Data

plot_grid(
  ggplot(dischargeUnit, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Flow(ft"^3*"/s)")) +
    ggtitle("Big Dry Creek - Highlands Ranch"),
  
  ncol = 1
)


#Baseflow Separation

Q_Base <- BaseflowSeparation(
  dischargeUnit$Flow_Inst, #instantaneous discharge flow
  filter_parameter = 0.99,
  passes = 3
)


#Combine the streamflow dataset and the baseflow dataset by column
dischargeUnit$bt <- Q_Base$bt


#Define Maximum Value
y.max<- max(dischargeUnit$Flow_Inst) + 200

#Create a Dygraph

dygraph( xlab="Date", ylab = "Flow (ft3/s)", main = "Big Dry Creek - Highlands Ranch",
         cbind(
           Flow = with(dischargeUnit, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(dischargeUnit, xts(bt, order.by = dateTime)) #baseflow
         )) %>%
  dyAxis("y", logscale = TRUE, valueRange = c(0.5, y.max)) %>%
  dyRangeSelector()



