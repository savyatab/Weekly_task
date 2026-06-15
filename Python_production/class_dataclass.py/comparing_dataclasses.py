from dataclasses import dataclass, field

@dataclass(order=True, frozen=True)
class Person:
    sort_index: int = field(init=False, repr=False)

    name: str
    job: str
    age: int
    strength: int = 100

    def __post_init__(self):
        object.__setattr__(self, "sort_index", self.age)


p1 = Person('Ram', 'DESIGNER', 22, 90)
p2 = Person('Sita', 'backend developer', 25)
p3 = Person('Hari', 'AI engineer', 24)

print(p1)
print(p1 > p2)