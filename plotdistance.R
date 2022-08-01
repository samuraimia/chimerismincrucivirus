library(ggplot2)
library(waldo)
library(dplyr)
library("doParallel")
library(foreach)
library(cluster)
library(datasets)
library(tidyverse)

#detects number of CPU cores
#multithreading
ncores=detectCores()
c1=makeCluster(7)
registerDoParallel(c1)
getwd()

#takes the distance files and makes it into a file which can plot the data

Bacilla = read.csv("Bacilladnadistances.csv", header = TRUE, sep=',')
Bacilla<-Bacilla[-c(135:61212),]
Bacilla$X = NULL
write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Bacilladnadistancemodified.csv", row.names = FALSE)

Circo = read.csv("Circodistances.csv", header = TRUE, sep=',')
Circo$X = NULL
Circo$X.1 = NULL
Circo<-Circo[-c(1035:61212),]
write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Circodistancesmodified.csv", row.names = FALSE)


Cruci = read.csv("Crucidistances.csv", header = TRUE, sep=',')
Cruci<-Cruci[-c(4950:61212),]
Cruci$X = NULL
write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Crucidistancesmodified.csv", row.names = FALSE)

Gemini = read.csv("Geminidistances.csv", header = TRUE, sep=',')
Gemini<-Gemini[-c(4753:61212),]
Gemini$X= NULL
write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Geminidistancesmodified.csv", row.names = FALSE)


Genomo = read.csv("Genomodistances.csv", header = TRUE, sep=',')
Genomo<-Genomo[-c(406:61212),]
Genomo$X= NULL
write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Genomodistancesmodified.csv", row.names = FALSE)


Kitrino = read.csv("Kitrinodistances.csv", header = TRUE, sep=',')
Kitrino<-Kitrino[-c(4950:61212),]
Kitrino$X= NULL
write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Kitrinodistancesmodified.csv", row.names = FALSE)


Smaco = read.csv("Smacodistances.csv", header = TRUE, sep=',')
Smaco<-Smaco[-c(1128:61212),]
Smaco$X= NULL
write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Smacodistancesmodified.csv", row.names = FALSE)

Tombus = read.csv("Tombusdistances.csv", header = TRUE, sep=',')
Tombus<-Tombus[-c(873:61212),]
Tombus$X= NULL
write.csv(distances,"C:\\Users\\ckraj\\Downloads\\Rstudiostuff\\Tombusdistancesmodified.csv", row.names = FALSE)


par(mar=c(5,4,4,8), xpd=TRUE)
par(pty='s')
  plot(Cruci$rep.distance, Cruci$capsid.distance, xlab="Distance between replication-associated genes", ylab="Distance between capsid genes",xlim=c(0,20), ylim=c(0,20), pch = 20, cex=0.25,col="orange1")

model = abline(lm(capsid.distance ~ as.numeric(as.character(rep.distance)),data=Cruci),col='orange1')

#overlay the plot
points(Gemini$rep.distance, Gemini$capsid.distance, xlim=c(0,20), ylim=c(0,20), pch = 20, cex=0.25, col="turquoise")
abline(lm(capsid.distance ~ as.numeric(as.character(rep.distance)),data=Gemini),col='turquoise')
points(Genomo$rep.distance, Genomo$capsid.distance, xlim=c(0,20), ylim=c(0,20), pch = 20, cex=0.25,col="red")
abline(lm(capsid.distance ~ as.numeric(as.character(rep.distance)),data=Genomo),col='red')
points(Kitrino$rep.distance, Kitrino$capsid.distance, xlim=c(0,20), ylim=c(0,20), pch = 20, cex=0.25,col="plum")
abline(lm(capsid.distance ~ as.numeric(as.character(rep.distance)),data=Kitrino),col='plum')
points(Smaco$rep.distance, Smaco$capsid.distance, xlim=c(0,20), ylim=c(0,20), pch = 20, cex=0.25,col="tan4")
abline(lm(capsid.distance ~ as.numeric(as.character(rep.distance)),data=Smaco),col='tan4')
points(Tombus$rep.distance, Tombus$capsid.distance, xlim=c(0,20), ylim=c(0,20), pch = 20, cex=0.25,col="gray70")
abline(lm(capsid.distance ~ as.numeric(as.character(rep.distance)),data=Tombus),col='red')
points(Bacilla$rep.distance, Bacilla$capsid.distance, xlim=c(0,20), ylim=c(0,20), pch = 20, cex=0.25,col="violetred3")
abline(lm(capsid.distance ~ as.numeric(as.character(rep.distance)),data=Bacilla),col='gray70')
points(Circo$rep.distance, Circo$capsid.distance, xlim=c(0,20), ylim=c(0,20), pch = 20, cex=0.25,col="navy")
abline(lm(capsid.distance ~ as.numeric(as.character(rep.distance)),data=Circo),col='navy')

#creating legend
 legend("topright", inset=c(-0.8, 0), legend=c("Cruci","Gemini", "Genomo", "Kitrino", "Smaco", "Tombus", "Bacilla", "Circo"),
        col=c("orange1" ,"turquoise", "red", "plum", "tan4", "gray70", "violetred3", "navy"), pch = 20, cex=1)



b<- 1
i = 1
x = 1



foreach(a= 1:nrow(rep), .combine=rbind) %do%
  {
    while (b < nrow(capsid))
    {
      if(rep$Species.1[a] == capsid$Species.1[b] || rep$Species.1[a] == capsid$Species.2[b])
      {
        if(rep$Species.2[a] == capsid$Species.1[b] || rep$Species.2[a] == capsid$Species.2[b])
        {
          
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

plot(distances$rep.distance, distances$capsid.distance, xlab="Distance between replication-associated genes", ylab="Distance between capsid genes", pch = 20, col="orange1")



