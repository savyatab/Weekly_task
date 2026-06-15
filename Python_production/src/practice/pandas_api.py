import requests
import pandas as pd
url ="https://jsonplaceholder.typicode.com/users"
data = requests.get(url).json()
df = pd.DataFrame(data)

print(df.head())