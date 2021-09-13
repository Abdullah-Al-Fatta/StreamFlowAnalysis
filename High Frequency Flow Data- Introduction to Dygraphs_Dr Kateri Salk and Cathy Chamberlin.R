
#High Frequency Flow Data- Introduction to Dygraphs

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

theme_set(theme_gray()) 

#Import Data from Third Fork Creek

dischargedatTFC2018 <- readNWISuv(
  site = "02097280", #Third Fork Creek at Woodcroft Parkway Near Blands NC
  parameterCd = "00060",
  startDate = "2018-01-01", 
  endDate = "2019-01-01"
) %>% 
  renameNWISColumns()

head(dischargedatTFC2018) #view first six observations only

#Import Data from Ellerbe Creek

dischargedatEC2018 <- readNWISuv(
  site = "0208675010", #Ellerbe Creek at Club Boulevard at Durham, NC
  parameterCd = "00060", 
  startDate = "2018-01-01", 
  endDate = "2019-01-01"
) %>% 
  renameNWISColumns()
head(dischargedatEC2018) #view first six observations only


#Plot Ellerbe Creek Discharge and Third Fork Creek Discharge on the same plot

plot_grid(
  ggplot(dischargedatTFC2018, aes(x = dateTime, y = Flow_Inst)) +
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Instantaneous Flow(ft"^3*"/s)")) +
    ggtitle("Third Fork Creek"),
  ggplot(dischargedatEC2018, aes(x = dateTime, y = Flow_Inst)) + 
    geom_line() + 
    scale_y_log10() +
    labs(x = "Date", y = expression("Instantaneous Flow(ft"^3*"/s)"))+
    ggtitle("Ellerbe Creek"),
  ncol = 1
)

#Third Fork Creek Baseflow Analysis
#BaseflowSeparation
#This function reads a streamflow dataset and produces a baseflow dataset. It can be run using 1, 2 or 3 passes. The output returns a 2 column data frame with nrow = length of input streamflow data. The first column contains #baseflow (bt), while the second contains quickflow (qft), both in the same units as the input.
  
TFCbaseflow <- BaseflowSeparation(
    dischargedatTFC2018$Flow_Inst, #instantaneous discharge flow
    filter_parameter = 0.925, #The value recommended by Nathan and McMahon (1990) is 0.925, however, the user might want to play with this value (0.9-0.95)
    passes = 3
  )
head(TFCbaseflow) #view first six observations of resultant data set

#Combine the streamflow dataset and the baseflow dataset by column
TFC2018 <- cbind(dischargedatTFC2018, TFCbaseflow)


#dygraph
#The package dygraphs produces dynamic graphics so that user can interact with the graph.

#Create a Dygraph of Third Fork
#Within the dygraph function, we'll insert the cbind function in order to ensure that we have only one dataframe with total flow, baseflow, and quickflow as columns.

dygraph( xlab="Date", ylab = "Instantaneous Flow (ft3/s)", main = "Baseflow vs. Quickflow at Third Fork Creek",
         cbind(
           Flow = with(TFC2018, xts(Flow_Inst, order.by = dateTime)), #total flow
           Baseflow = with(TFC2018, xts(bt, order.by = dateTime)), #baseflow
           Quickflow = with(TFC2018, xts(qft, order.by = dateTime)) #quickflow
         )) %>%
  dyAxis("y", valueRange = c(0, 2600)) %>%
  dyRangeSelector() 


#Calculate the proportion of water emerging as quickflow and baseflow

Export <- TFC2018 %>%
  mutate(timestep = c(diff(as.numeric(dateTime)), NA_real_), #find out step between each of the timestamps- most timestamps are 15 min but there are a couple gaps. 
         baseflowexport = bt * timestep,
         quickflowexport = qft * timestep) %>% #ft^3/sec * seconds elapsed to just get the volume

summarize(BaseflowExport_cf = sum(baseflowexport, na.rm = T),
          QuickflowExport_cf = sum(quickflowexport, na.rm = T),
          TotalExport_cf = BaseflowExport_cf + QuickflowExport_cf)
#Baseflow
Export$Baseflow/Export$TotalExport_cf*100


#Quickflow
Export$QuickflowExport_cf/Export$TotalExport_cf*100


#How does the magnitude of baseflow compare to the magnitude of quickflow?
#Repeat this baseflow/quickflow analysis for Ellerbe Creek. How do the percentages compare?

Ellerbebaseflow <- BaseflowSeparation(
    dischargedatEC2018$Flow_Inst, 
    filter_parameter = 0.925, 
    passes = 3)
#Bind Ellerbe Data Frame to Ellerbe Baseflow/Quickflow dataframe
EC2018 <- cbind(dischargedatEC2018, Ellerbebaseflow)

#Calculate the proportion of water emerging as quickflow and baseflow

ExportEllerbe <- EC2018 %>%
  mutate(timestep = c(diff(as.numeric(dateTime)), NA_real_), 
         baseflowexport = bt * timestep,
         quickflowexport = qft * timestep) %>% 
  summarize(BaseflowExport_cf = sum(baseflowexport, na.rm = T),
            QuickflowExport_cf = sum(quickflowexport, na.rm = T),
            TotalExport_cf = BaseflowExport_cf + QuickflowExport_cf)
#Baseflow
ExportEllerbe$Baseflow/ExportEllerbe$TotalExport_cf*100

#Quickflow
ExportEllerbe$QuickflowExport_cf/ExportEllerbe$TotalExport_cf*100

#Based on the proportions of baseflow and quickflow for both creeks, Ellerbe Creek has more quickflow, but Third Fork Creek has more baseflow. 
#Thus, Ellerbe Creek might have more urban surfaces, roads, and houses, while Third Fork Creek might have more open area. They both are urban streams, however.

#Reference: Garcia, G., K. Salk, C. Chamberlin (2021). High Frequency Flow Data: Introduction to Dygraphs, HydroShare, http://www.hydroshare.org/resource/f1a6d0346ba94337a247ac7c62f16a2a



