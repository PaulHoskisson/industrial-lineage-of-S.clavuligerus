import pandas as pd

# Step 1: keep only selected columns of interest
columns_to_keep = ['Hour', 'A3_N-Acetyl-D_Glucosamine', 'A5_Succinic_Acid', 'A7_L-Aspartic_Acid', 'B3_Glycerol', 'B6_D-Gluconic_Acid', 'B12_L-Glutamic_Acid', 'C3_D-L-Malic_Acid', 'C10_Maltose', 'D-1_L-Asparagine', 'D3_D-Glucosaminic_Acid', 'D5_Tween_40', 'D6_a-Keto-Glutaric_Acid', 'E1_L-Glutamine', 'E5_Tween_80', 'E10_Maltotriose', 'E11_2-DeoxyAdenosine', 'E12_Adenosine', 'F2_Citric_Acid', 'F5_Fumaric_Acid', 'F6_Bromo_Succinic_Acid', 'F12_Inosine', 'G4_L-Threonine', 'G5_L-Alanine', 'G6_L-Alanyl-Glycine', 'G12_L-Malic_Acid', 'H1_Glycyl-L-Proline']
# Step 2: Read the CSV file into a DataFrame
df = pd.read_csv("Biolog/data/1_raw/738_1_1.csv", usecols=columns_to_keep)
# Step 3: Drop the last row from the DataFrame
df = df[:-1]
# Step 4: Select only the first 194 rows (~48 hours)
df = df.iloc[:194]
# Step 5: Melt the DataFrame 'df' by keeping 'Hour' as the identifier variable
# The columns other than 'Hour' will be transformed into rows
# 'Type' will be the new column name for the variable names
# 'Value' will be the new column name for the values of these variables
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
# Step 6: Save the melted DataFrame 'melted_df' to a CSV file
# The file path is specified, and 'index=False' means do not write row names (indices) to the CSV file
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/738_1_1_PM1_melted_48h_cutdown.csv", index=False)

# Step 7: repeat this for each file

df = pd.read_csv("Biolog/data/1_raw/738_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/738_1_1_PM1_melted_48h_cutdown.csv", index=False)
df = pd.read_csv("Biolog/data/1_raw/738_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/738_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC2_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC2_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC2_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC3_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC3_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC3_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC4_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC4_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC4_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC5_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC5_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC5_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC6_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC6_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC6_1_1_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/738_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/738_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/738_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC2_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC2_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC2_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC3_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC3_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC3_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC4_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC4_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC4_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC5_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC5_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC5_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC6_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC6_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC6_1_2_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/738_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/738_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/738_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC2_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC2_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC2_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC3_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC3_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC3_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC4_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC4_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC4_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC5_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC5_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC5_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC6_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC6_1_3_PM1_melted_48h_cutdown.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/3_melted_48h_cutdown/SC6_1_3_PM1_melted_48h_cutdown.csv", index=False)