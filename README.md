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
- Used in the processing of biolog data.  Two major routes taken either: (1) analysing 48h of sample, or (2) all using BactExtract (https://github.com/veeninglab/BactEXTRACT)  with (3) used in the visualisation of the data.  Major files included here are for data manipulation and ploting.

(1)
- - 01_get_tidy_data_S_clav_48hours.py
- - 02_get_tidy_data_S_clav_cutdown_48hours.py
- - 03_growth_curve_plots_48h.R
- - 04_growth_curve_plots_cutdown_48h.R
 
(2)
- - 05_Interleaved_script.R
- - 06_filtering_bactExtract.R

(3)
- - Diet_breadth_R_graph_24-6-24.R
- - pheatmap_R-script_17-6-24.R
- - Violin_plot_24_6_24.R
