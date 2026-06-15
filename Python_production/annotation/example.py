from typing import List, Dict, Optional

# data model
User = Dict[str, Optional[str]]

# Extract (fetch data)
def extract_users() -> List[User]:
    return [
        {"id": "1", "name": "Ram", "email": "ram@gmail.com"},
        {"id": "2", "name": "Samila", "email": "samila@gmail.com"},
        {"id": "3", "name": None, "email": "unknown@gmail.com"},
    ]

# Transform
def transform_users(users: List[User]) -> List[User]:
    cleaned_users: List[User] = []

    for user in users:
        # fix missing name
        if user["name"] is None:
            user["name"] = "Unknown"

        # normalize email
        if user["email"]:
            user["email"] = user["email"].lower()

        cleaned_users.append(user)

    return cleaned_users

# Load
def load_users(users: List[User]) -> None:
    for user in users:
        print(f"Saving user: {user}")

# Pipeline
def run_pipeline() -> None:
    users = extract_users()
    transformed = transform_users(users)
    load_users(transformed)

# Run program
if __name__ == "__main__":
    run_pipeline()