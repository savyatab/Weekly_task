import requests,json
from src.logger import get_logger
from src.retry import retry

log = get_logger()
class APIClient:
    def __init__(self):
         self.url = "https://jsonplaceholder.typicode.com/users"
    @retry
    def fetch(self):
        log.info("Fetching data...")
        res = requests.get(self.url)
        data = res.json()
        with open("data/raw.json", "w") as f:
            json.dump(data, f)
        return data