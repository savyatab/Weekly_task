from dataclasses import dataclass
@dataclass
class Person:
    name :str
    job : str
    age : str

p1= Person('Ram','DESIGNER',22)
p2 = Person('Sita','backend develeoper',25)
p3 = Person('Hari','AI engineer',24)
print(id(p2))
print(id(p3))
print(p1)

print(p1 == p2)