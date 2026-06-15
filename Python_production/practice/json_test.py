#converting dataframes in json
#Structured format used in APIs. (You are working with APIs or web data)
import pandas as pd
data ={
    "id" : [1, 2],
    "name" : ["Awan","sumit"]
    }
df =pd.DataFrame(data)
#writing in json
df.to_json("test.json",orient="records",indent=2)
df2 = pd.read_json("test.json")
print(df2)