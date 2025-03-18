# Industrial lineage of _S. clavuligerus_
Code and data associated with analysis of an industrial lineage of Streptomyces clavuligerus from GlaxoSmithKline.

Manuscript link:

Code and data included:
- 01_Comparitive_genomics_and_SNP_calling
- 02_Omnilog_biolog_analysis
- 03_RNA_seq
- Supplementary_material

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

(1) analysing 48h of sample
- 01_get_tidy_data_S_clav_48hours.py
- 02_get_tidy_data_S_clav_cutdown_48hours.py

(2) all time points using BactExtract 
- 05_Interleaved_script.R
- 06_filtering_bactExtract.R

(3) visualisation of the data
- 03_growth_curve_plots_48h.R
- 04_growth_curve_plots_cutdown_48h.R
- Diet_breadth_R_graph_24-6-24.R
- pheatmap_R-script_17-6-24.R
- Violin_plot_24_6_24.R

---------------------------------

03_RNA_seq
- Used for differential expression comparison and figure generation of the RNA-seq data (available: Gene Expression Omnibus (GEO): GSE212322)).  A range of starter files and those referenced in the R-script are included.

bash.salmon.bash
- Bash script with GEO reference numbers for each raw_read file.  Add these files to the "raw_data" folder and ensure named e.g. "raw_data/SC2_1/SC2_2_1.fq.gz".  This will generate the quantification files referenced in the main R-script using Salmon (https://combine-lab.github.io/salmon/getting_started/).

01_Deseq_17_03_25.R
- Major R-script performing differential analysis of Salmon processed RNA-seq fastq data.
- Major steps:
- - import conditional files
- - add row names to the data frame
- - Select desired columns
- - Get paths to quant files
- - assign anmes to quant files
- - read tx2genes file (included: "tx2gene_01-07-24.csv")
- - Perform tximport
- - Perform differential expression analysis using DESeq2 (there are several substeps here).
- - - There are several steps here for generating human readable output files including adding KEGG data to the files.
- - Generate PCA plot
- - Generate figure 5C using phylogenetic tree values and PCA plit coordinates
- - Isolate differential expressed genes for files and Venn Diagram plotting (figure 5A)
- - Generate heatmaps for supplementary figures
- - generate figure for dN/dS analysis.

----------------------------------

Supplementary_material
- Supplementary material for the manuscript.
- Supplementry_Table_1_and_1-30_figures_01_07_24.docx
- Supplementary table 2. Combined SNPs from SC2-SC6_17_03_25.csv
- Supplementary table 3. Gene Ontology results.csv
- Supplementary table 4. Master table of unfiltered RNA-seq DEGs.csv
- Supplementary table 5. List of SC2-SC3 DEGs (169).csv
- Supplementary table 6. List of SC2-SC4 DEGs (512).csv
- Supplementary table 7. List of SC4-SC5 DEGs (1727).csv
- Supplementary table 8. List of SC5-SC6 DEGs (1770).csv
- Supplementary table 9. List of SC2-SC6 DEGs (276).csv
- Supplementary table 10. List of SC2v-All DEG (37) .csv
- Supplementary File 1.docx

