def extract_data():
    for i in range(5):
        yield{"id": i,"value": i*10}

def transform(data):
    for item in data:
        item["value"] *= 2 
        yield item
def load(data):
    for item in data:
        print("Saving:", item)
pipeline = load(transform(extract_data()))
