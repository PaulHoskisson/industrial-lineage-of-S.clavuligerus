import pandas as pd

# Step 1: keep only selected columns of interest

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
melted_df.to_csv("Biolog/data/2_melted_48h/738_1_1_PM1_melted_48h.csv", index=False)

# Step 7: repeat this for each file

df = pd.read_csv("Biolog/data/1_raw/738_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/738_1_1_PM1_melted_48h.csv", index=False)
df = pd.read_csv("Biolog/data/1_raw/738_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/738_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC2_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC2_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC2_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC3_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC3_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC3_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC4_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC4_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC4_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC5_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC5_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC5_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC6_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC6_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_1.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC6_1_1_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/738_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/738_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/738_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC2_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC2_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC2_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC3_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC3_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC3_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC4_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC4_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC4_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC5_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC5_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC5_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC6_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC6_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_2.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC6_1_2_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/738_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/738_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/738_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/738_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC2_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC2_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC2_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC2_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC3_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC3_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC3_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC3_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC4_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC4_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC4_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC4_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC5_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC5_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC5_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC5_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC6_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC6_1_3_PM1_melted_48h.csv", index=False)

df = pd.read_csv("Biolog/data/1_raw/SC6_1_3.csv", usecols=columns_to_keep)
df = df[:-1]
df = df.iloc[:194]
melted_df = pd.melt(df, id_vars=['Hour'], var_name='Type', value_name='Value')
melted_df.to_csv("Biolog/data/2_melted_48h/SC6_1_3_PM1_melted_48h.csv", index=False)