#!/bin/bash
# 01_annotate_genomes.sh
# Script used to annotate genomes with prokka


# Align each set of SCOs
for fname in ../data/raw_data/*; do
    prokka --prefix `basename ${fname%%.fa}` --outdir ../output/prokka/`basename ${fname%%.fa}` --compliant $fname
   
done