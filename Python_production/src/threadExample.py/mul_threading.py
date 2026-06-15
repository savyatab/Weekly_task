import threading

def task(name):
    print(f"name {name}")
t1 = threading.Thread(target=task, args=("S1",))
t2 = threading.Thread(target=task, args=("S2",))

t1.start()
t2.start()

t1.join()
t2.join()