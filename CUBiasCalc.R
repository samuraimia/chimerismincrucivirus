#importing packages
library(stats4)
library(stats)
library(graphics)
library(grDevices)
library(utils)
library(datasets)
library(methods)
library(base)
library(Biobase)
library(XVector)
library(BiocGenerics)
library(knitr)
library(Biostrings)
library(IRanges)
library(ggplot2)
library(BiocStyle)
library(GenomeInfoDb)
library(S4Vectors)
library(coRdon)
library(seqinr)


#file must be inside the sequences folder within seqinr
rcds <- read.fasta(file = system.file("sequences/22CPs.fasta", package = "seqinr"))[[1]]
uco( rcds, index = "freq")
uco( rcds, index = "rscu")
uco( rcds, as.data.frame = TRUE)
