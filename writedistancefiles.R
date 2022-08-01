library(ggplot2)
library(waldo)
library(dplyr)
library("doParallel")
library(foreach)
library(cluster)
library(datasets)
library(tidyverse)

ncores=detectCores()
c1=makeCluster(7)
registerDoParallel(c1)
getwd()


# importing rep.csv file to global environment, read them
# cleaning data: removing hyphen for consistency
rep <- read.csv("TombusRdRp.csv", header = TRUE, sep=',')
rep$Species.1 <- trimws(rep$Species.1, whitespace = ' - .*')
rep$Species.2 <- trimws(rep$Species.2, whitespace = ' - .*')
capsid <- read.csv("TombusCP.csv", header=TRUE, sep=',')
capsid$Species.1 <- trimws(capsid$Species.1, whitespace = ' - .*')
capsid$Species.2 <- trimws(capsid$Species.2, whitespace = ' - .*')
distances <- read.csv("emptydistances - Sheet1 (1).csv", header = TRUE, sep=',')

b<- 1
i = 1
x = 1
# 
# 


foreach(a= 1:nrow(rep), .combine=rbind) %do%
  {
    while (b < nrow(capsid))
    {
      if(rep$Species.1[a] == capsid$Species.1[b] || rep$Species.1[a] == capsid$Species.2[b])
      {
        if(rep$Species.2[a] == capsid$Species.1[b] || rep$Species.2[a] == capsid$Species.2[b])
        {
          
          # print(capsid$Dist[b])
          distances$rep.distance[i] <- rep$Dist[a]
          i = i+1
          distances$capsid.distance[x] <- capsid$Dist[b]
          x = x+1
        }
        
      }
      b = b+1
    }
    b=1
  }


