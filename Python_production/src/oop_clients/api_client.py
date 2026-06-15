import requests

class APIClient:
    def __init__(self, base_url):  #api link->base url
        self.base_url = base_url

    def get_data(self, endpoint):  #endpoint → specific API path (like `/posts/1`)
        url = self.base_url + endpoint
        res = requests.get(url)  #storing response 

        if res.status_code != 200:
            print("Something went wrong:", res.status_code)
            return None
        return res.json()  #if request is successful then coverts json format into list/dict
api = APIClient("https://jsonplaceholder.typicode.com")
data = api.get_data("/posts/1")

print(data)