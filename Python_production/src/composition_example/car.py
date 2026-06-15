from engine import engine
class Car:
    def __init__(self):
        self.engine = engine()
    def drive(self):
        self.engine.start()
        print("Car moves")

