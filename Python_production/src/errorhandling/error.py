# retry example
import time
import random

for attempt in range(3):
    try:
        print("Try........")

        if random.random()<0.7:
            raise Exception("Failed")

        print("Success..............")
        break
    except Exception as e:
        print("Error",e)
        time.sleep(1)