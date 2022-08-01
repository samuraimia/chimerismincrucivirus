
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



rcds <- read.fasta(file = system.file("sequences/22CPs.fasta", package = "seqinr"))[[1]]
uco( rcds, index = "freq")
uco( rcds, index = "rscu")
uco( rcds, as.data.frame = TRUE)

# stopifnot(mySmallProtein == "SEQINRSEQINRSEQINRSEQINR*")
# 
#   
# rp <- system.file("seqAA.fasta", package = "seqinr")
# protein=read.fasta(rp)


# uco( rp, index = "freq")
# uco( rp, index = "eff")
# uco( rp, index = "rscu")
# uco( rp, as.data.frame = TRUE)

# # reading fasta nucleotide files
DNArp <- readSet(
  file="https://raw.githubusercontent.com/samuraimia/codonusageanalysis/main/repnuc.fasta?token=GHSAT0AAAAAABXBR5K5RZG2ZC6LA2SL5QCGYXDBIVA"
)
uco( DNArp, index = "freq")
uco( DNArp, index = "eff")
uco( DNArp, index = "rscu")
uco( DNArp, as.data.frame = TRUE)


# rp <- codonTable(DNArp)
# 
# DNAcapsid = readSet(file="https://raw.githubusercontent.com/samuraimia/codonusageanalysis/main/CPnuc.fasta?token=GHSAT0AAAAAABXBR5K4LOD6ZG6XKVNYQLY4YXDBJMA")
# capsid <- codonTable(DNAcapsid)
# 
# 
# 
# capsidmilc <- MILC(capsid)
# head(capsid)
# 
# rpmilc <- MILC(rp)
# head(rp)
# 
# plot(rpmilc[,"self"],capsidmilc[,"self"])
# 
# # capsid <- codonTable(DNAcapsid)[1:3,]
# # 
# # #codon counting
# # 
# # 
# # # rpcc = codonCounts(rp)[1:2,]
# # # head(rpcc)
# # 
# # capsidcc <- codonCounts(capsid)[1:9,]
# # head(capsidcc)
# # 
# # #length of the files
# # 
# # lenrp <- getlen(rp)
# # head(lenrp)
# # 
# # lencapsid <- getlen(capsid)
# # head(lencapsid)
# # 
# # length(rp)
# # length(capsid)
# # 
# # #calculating codon usage bias using Measure Independent
# # #length and composition (MILC)
# # 
# # milccapsid = MILC(capsid, ribosomal = FALSE, self = TRUE)
# # # head(milccapsid)
# # 
# # milcrp = MILC(rp, ribosomal = FALSE, self = TRUE)
# # # head(milcrp)
# # 
# # milccompare = MILC(rp, ribosomal = FALSE, self = FALSE, 
# #             subsets = list(capsid))
# # head(milccompare)
# # 
# # # xlab = "CU bias to self (capsid)"
# # # ylab = "CU bias, capsid compared to rep"
# # # 
# # # Bplot(x = "self", y = "self", data = milccapsid)+
# # #   labs(x = xlab, y = ylab)
# # 
# # 
# # 
# # 
# 
