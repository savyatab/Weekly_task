#backoff-> increasing wait time between retries
import time

for attempt in range(4):
    print(f"Attempt {attempt +1 }")

    wait_time = 2 ** attempt  #2 raised to the power of attempt i.e 2**0 result 1 ,2**1 ,result-> 2...2**3 ,result-> 8
    print(f"Waiting{wait_time}seconds....\n")

    time.sleep(wait_time)