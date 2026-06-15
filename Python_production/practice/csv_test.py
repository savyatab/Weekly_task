#create and read csv file 
#You want simple and readable data
#Simple table format stored as text
import pandas as pd 
data ={
    "id": [1,2,3,4,5],
    "name":["ram","shyam","hari","gita","rita"]
}
df = pd.DataFrame(data)
df.to_csv("test.csv")
df2 = pd.read_csv("test.parquet")
print(df2)