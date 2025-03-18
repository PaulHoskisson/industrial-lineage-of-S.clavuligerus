library("dplyr")

#SC3 excluded as an empty file
dfSC4_SC2= read.csv(file = "/Users/johnmunnoch/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/After_NCBI/2_genomes/snippy/SC4/snps.csv", sep =",",quote = "\"",stringsAsFactors = TRUE,strip.white = TRUE)
dfSC5_SC2= read.csv(file = "/Users/johnmunnoch/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/After_NCBI/2_genomes/snippy/SC5/snps.csv", sep =",",quote = "\"",stringsAsFactors = TRUE,strip.white = TRUE)
dfSC6_SC2= read.csv(file = "/Users/johnmunnoch/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/After_NCBI/2_genomes/snippy/SC6-1/snps.csv", sep =",",quote = "\"",stringsAsFactors = TRUE,strip.white = TRUE)

df_merge = rbind(dfSC4_SC2, dfSC5_SC2, dfSC6_SC2)

df_merge_cut = subset(df_merge, select = -c(EVIDENCE))
df_duplicates = df_merge_cut[!duplicated(df_merge_cut),]

df_merge_cut_anti = df_merge %>% anti_join(df_duplicates, by = c("POS" = "POS"))
df_merge_cut_semi = df_merge %>% semi_join(df_duplicates, by = c("POS" = "POS"))

df_duplicates_SC4_SC2_anti <- df_duplicates %>% anti_join(dfSC4_SC2, by = c("POS" = "POS", "TYPE" = "TYPE", "REF" = "REF", "ALT" = "ALT"))
df_duplicates_SC4_SC2_semi <- df_duplicates %>% semi_join(dfSC4_SC2, by = c("POS" = "POS", "TYPE" = "TYPE", "REF" = "REF", "ALT" = "ALT"))

df_duplicates_SC5_SC2_anti <- df_duplicates %>% anti_join(dfSC5_SC2, by = c("POS" = "POS", "TYPE" = "TYPE", "REF" = "REF", "ALT" = "ALT"))
df_duplicates_SC5_SC2_semi <- df_duplicates %>% semi_join(dfSC5_SC2, by = c("POS" = "POS", "TYPE" = "TYPE", "REF" = "REF", "ALT" = "ALT"))

df_duplicates_SC6_SC2_anti <- df_duplicates %>% anti_join(dfSC6_SC2, by = c("POS" = "POS", "TYPE" = "TYPE", "REF" = "REF", "ALT" = "ALT"))
df_duplicates_SC6_SC2_semi <- df_duplicates %>% semi_join(dfSC6_SC2, by = c("POS" = "POS", "TYPE" = "TYPE", "REF" = "REF", "ALT" = "ALT"))

df_duplicates_SC4_SC2_anti['Match'] <-""
df_duplicates_SC4_SC2_semi['Match'] <-"SC4_SC2"

df_duplicates_SC5_SC2_anti['Match'] <-""
df_duplicates_SC5_SC2_semi['Match'] <-"SC5_SC2"

df_duplicates_SC6_SC2_anti['Match'] <-""
df_duplicates_SC6_SC2_semi['Match'] <-"SC6_SC2"

df_merge_SC4_SC2 = rbind(df_duplicates_SC4_SC2_anti, df_duplicates_SC4_SC2_semi)
df_merge_SC5_SC2 = rbind(df_duplicates_SC5_SC2_anti, df_duplicates_SC5_SC2_semi)
df_merge_SC6_SC2 = rbind(df_duplicates_SC6_SC2_anti, df_duplicates_SC6_SC2_semi)

attach(df_merge_SC4_SC2)
df_merge_SC4_SC2 = df_merge_SC4_SC2[order(POS),]
detach(df_merge_SC4_SC2)
attach(df_merge_SC5_SC2)
df_merge_SC5_SC2 = df_merge_SC5_SC2[order(POS),]
detach(df_merge_SC5_SC2)
attach(df_merge_SC6_SC2)
df_merge_SC6_SC2 = df_merge_SC6_SC2[order(POS),]
detach(df_merge_SC6_SC2)

attach(df_duplicates)
df_duplicates_sorted = df_duplicates[order(POS),]
detach(df_duplicates)

names(df_merge_SC4_SC2)[names(df_merge_SC4_SC2) == "Match"] <- "SC4_SC2"
names(df_merge_SC5_SC2)[names(df_merge_SC5_SC2) == "Match"] <- "SC5_SC2"
names(df_merge_SC6_SC2)[names(df_merge_SC6_SC2) == "Match"] <- "SC6_SC2"

total = cbind(df_duplicates_sorted, SC3_SC2 = "")
total = cbind(total, SC4_SC2 = df_merge_SC4_SC2$SC4_SC2)
total = cbind(total, SC5_SC2 = df_merge_SC5_SC2$SC5_SC2)
total = cbind(total, SC6_SC2 = df_merge_SC6_SC2$SC6_SC2)

summary(total)

write.csv(total, "/Users/johnmunnoch/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/After_NCBI/2_genomes/snippy/SNPS_combined.csv", row.names = FALSE)
