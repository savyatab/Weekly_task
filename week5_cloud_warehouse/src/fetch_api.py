import requests
import json
from pathlib import Path

url = "https://jsonplaceholder.typicode.com/posts"
response = requests.get(url)
Path("data/raw").mkdir(parents=True, exist_ok=True)

with open("data/raw/posts.json", "w") as f:
    json.dump(response.json(), f, indent=2)

print("Raw data saved")

