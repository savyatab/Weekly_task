import time
def retry(func):
    def wrapper(*args, **kwargs):  #inner function
        for _ in range(3):
            try:
                return func(*args, **kwargs)
            except Exception as e:
                print(f"Retrying due to: {e}")
                time.sleep(1)
        raise Exception("Failed after retries")
    return wrapper