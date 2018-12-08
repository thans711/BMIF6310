#basicSTARRseq lines
library(Rsamtools)
library(BasicSTARRseq)

#import bam files into R
starrSeq.bam <- scanBam("/data/hodges_lab/EH4397/hansetj1/3_mapped_reads/Bar3.no_chrM.sorted.bam")
input.bam <- scanBam("/data/hodges_lab/EH4397/hansetj1/3_mapped_reads/Bar2.no_chrM.sorted.bam")

#set up R object
starrseqFileName <- starrSeq.bam
inputFileName <- input.bam

print("pre-STARRseqData")

data <- BasicSTARRseq::STARRseqData(sample=starrseqFileName, control=inputFileName, pairedEnd=TRUE)

print("post-STARRseqData")

#call peaks on object
peaks <- getPeaks(data)

print("post-peaks")

#write peaks to tab-deliminated txt file
write.table(peaks, "/data/hodges_lab/EH4397/hansetj1/4_peaks/HEK_ATAC_STARR_peaks.txt", sep="\t")

print("done")