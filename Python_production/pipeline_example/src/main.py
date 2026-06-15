import json
from src.api_client import APIClient
from src.models import User
from src.transform import transform

def run():
    client = APIClient()
    #EXCTARCT
    raw = client.fetch()
    #validate
    valid = [User(**u).dict() for u in raw]
    # transform
    processed = transform(valid)
    # save processed
    with open("data/processed.json", "w") as f:
        json.dump(processed, f)

    print("Done")

if __name__ == "__main__":
    run()