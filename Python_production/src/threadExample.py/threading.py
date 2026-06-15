import threading

def task():
    print("hello")
t = threading.Thread(target=task)
t.start()
t.join()