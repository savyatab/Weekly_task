class Person:
    name :str
    job : str
    age : str

    def __init__(self,name,job,age):
        self.name = name
        self.age = age
        self.job = job
p1= Person('Ram','DESIGNER',22)
p2 = Person('Sita','backend develeoper',25)
p3 = Person('Sita','backend develeoper',25)
print(id(p2))
print(id(p3))
print(p1)

print(p1 == p2)