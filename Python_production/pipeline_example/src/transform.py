def transform(data):
    return [
        #creating a dictionary for each user
        {
            "id": u["id"],
            "name": u.get("name", "").lower().strip()
        }
        for u in data
    ]