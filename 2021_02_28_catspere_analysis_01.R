rm(list = ls())
library(tidyverse)
library(ape)
library(pegas)
library(PopGenome)
getwd()
file.show("catspere_cds_primates_outgroup_blast_musclealign_trim.fas")
pd = read.dna("catspere_cds_primates_outgroup_blast_musclealign_trim.fas", format = "fasta")
pda = as.alignment(pd)
pda$nb
pda$nam
alview(pd)
base.freq(pd)
GC.content(pd)
length(seg.sites(pd))
S = length(seg.sites(pd))
L = 3424
s = S/L
s
primate = read.fasta("catspere_cds_primates_outgroup_blast_musclealign_trim.fas")
length(primate$Humans)
x = dist.gene(pd, method = "percentage", pairwise.deletion = FALSE, variance = FALSE)
x[1:465] #all of them
x[1:30]# just the human ones
human_divergence_times = c(6,6,10,13,17,35,55,35,55,25,25,25,25,35,25,35,55,25,25,55,25,25,55,17,25,25,25,25,35,65)
human = x[1:30]
plot(human, human_divergence_times)
plot(human, human_divergence_times, main = "Catspere Gene Divergence in Primates from Human", xlab = "Percentage of Gene Divergence", ylab = " Divergence Time")
lm(human_divergence_times ~ human)
abline(10.55, 95.06)



