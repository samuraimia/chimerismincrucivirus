library(ggplot2)
library(waldo)
library(dplyr)
library("doParallel")
library(foreach)
library(cluster)
library(datasets)
library(tidyverse)

ncores=detectCores()
c1=makeCluster(7) #change this number depending on how many CPU cores the computer has
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


Tombus = read.csv("Tombusdistances.csv", header = TRUE, sep=',')
Tombus<-Tombus[-c(873:61212),]
Tombus$X= NULL
write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Tombusdistancesmodified.csv", row.names = FALSE)

# Bacilla = read.csv("Bacilladnadistance.csv", header = TRUE, sep=',')
# Bacilla<-Bacilla[-c(135:61212),]
# Bacilla$X = NULL
# write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Bacilladnadistancemodified.csv", row.names = FALSE)
# 
# Circo = read.csv("Circodistances.csv", header = TRUE, sep=',')
# Circo$X = NULL
# Circo$X.1 = NULL
# Circo<-Circo[-c(1035:61212),]
# write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Circodistancesmodified.csv", row.names = FALSE)
# 
# 
# Cruci = read.csv("Crucidistances.csv", header = TRUE, sep=',')
# Cruci<-Cruci[-c(4950:61212),]
# Cruci$X = NULL
# write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Crucidistancesmodified.csv", row.names = FALSE)
# 
# Gemini = read.csv("Geminidistances.csv", header = TRUE, sep=',')
# Gemini<-Gemini[-c(4753:61212),]
# Gemini$X= NULL
# write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Geminidistancesmodified.csv", row.names = FALSE)
# 
# 
# Genomo = read.csv("Genomodistances.csv", header = TRUE, sep=',')
# Genomo<-Genomo[-c(406:61212),]
# Genomo$X= NULL
# write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Genomodistancesmodified.csv", row.names = FALSE)
# 
# 
# Kitrino = read.csv("Kitrinodistances.csv", header = TRUE, sep=',')
# Kitrino<-Kitrino[-c(4950:61212),]
# Kitrino$X= NULL
# write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Kitrinodistancesmodified.csv", row.names = FALSE)
# 
# 
# Smaco = read.csv("Smacodistances.csv", header = TRUE, sep=',')
# Smaco<-Smaco[-c(1128:61212),]
# Smaco$X= NULL
# write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Smacodistancesmodified.csv", row.names = FALSE)




