roles = {
    "analyst": ["SELECT"],
    "engineer": ["SELECT", "INSERT"],
    "admin": ["ALL"]
}

print("IAM Roles:", roles)