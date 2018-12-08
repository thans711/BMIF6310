#!/bin/bash
#This script uses awk to first convert the BasicSTARRseq output txt file to a bed format file. The bed file is then filtered based on enrichment score > 1.0 using the awk command. 
#a.txt represents the BasicSTARRseq output file. 
#a.4col.clean.bed represents the active enhacner regions. 

awk 'BEGIN{OFS="\t"} {print $2}' a.txt > a.chr.txt
awk 'BEGIN{FS='"';}{print $2}' a.chr.txt > a.chr.clean.txt
awk 'BEGIN{FS="""}{print $2}' a.chr.txt > a.chr.clean.txt
awk 'BEGIN{FS="\""}{print $2}' a.chr.txt > a.chr.clean.txt
awk 'BEGIN{FS="\""}{if (NR>1) print $2}' a.chr.txt > a.chr.clean.txt
awk 'BEGIN{OFS="\t"}{print $3,$4,$10}' a.txt > a.rest.txt
awk 'BEGIN{OFS="\t"}{if (NR>1) print $3,$4,$10}' a.txt > a.rest.txt
paste a.chr.clean.txt a.rest.txt > a.4col.bed
awk '{if ($4>1.0) print}' a.4col.bed > a.4col.clean.bed