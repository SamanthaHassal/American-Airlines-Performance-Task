import pandas as pd

#create dictionary of codes and labels including a free space
codes = ["A", "D", "L", "O", "P", ""]
labels = ["Atlantic", "Domestic US", "Latin", "South Pacific", "Pacific", "Net Flown Revenue"]
text_dict = {"Codes": codes, "Labels": labels}

# turn the dictionary into a data frame
my_DF = pd.DataFrame(text_dict)

# write to a CSV file
my_DF.to_csv("CodesAndLabels.csv", index=False)