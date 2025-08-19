import pandas as pd

read_df = pd.read_html("https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes", header=1)
df= read_df[0]
df = df.iloc[:, [1, 5]]
df = df.rename(columns={'Official state name[6][a]':'Country_name', 'Num. [5]':'Country_code'})
df = df.sort_values(by='Country_code',ascending=True)
df = df.head(249)
df.to_csv('country_code.csv', index=False)
df.index = df.index.astype(int)
