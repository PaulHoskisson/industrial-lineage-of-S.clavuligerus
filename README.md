# Industrial lineage of _S. clavuligerus_
Code and data associated with analysis of an industrial lineage of Streptomyces clavuligerus from GlaxoSmithKline.

Manuscript link:

Code and data included:
- 01_Comparitive_genomics_and_SNP_calling
- 02_Omnilog_biolog_analysis
- 03_RNA_seq

--------------------------------

01_Comparitive_genomics_and SNP_calling
- Files include the genbank files for each of the reported genomes from SC2 (1 and 2) to SC6 (1 and 2).  Used to generate the synteny plot in the manuscript:

01_annotate_genomes.sh
- Format the files appropriotely from the PROKKA genbank files.  

02_get_synteny_plots.ipynb
- Generates plot etc.
  
Used to generate a .csv file combining the SNIPPY (https://github.com/tseemann/snippy) output from a mapping SC3-SC6 to SC2:
03_snippy_combine.R
      - file formatted to show mutations etc. identified and in which strains.

---------------------------------

02_Omnilog_biolog_and_SNP_calling     
- Used in the processing of biolog data.  Two major routes taken either analysing 48h of sample, or all using BactExtract (https://github.com/veeninglab/BactEXTRACT).

- - test
