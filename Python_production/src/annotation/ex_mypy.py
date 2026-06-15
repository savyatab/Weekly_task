type checker
from typing import List

def total(numbers: List[int]) -> int:
    return sum(numbers)

data = [1, 2, 3, 4]
print(total(data))
print(total("1234"))


#mannual runtime check
from typing import List

def total(numbers: List[int]) -> int:
    if not isinstance(numbers, list):
        raise TypeError("Expected a list of integers")

    return sum(numbers)

    #mypy and pyright are not same but they do the same job in differenet way
    #mypy-> catch every type issue carefully
    #pyright-> give fast,practical feedback while coding