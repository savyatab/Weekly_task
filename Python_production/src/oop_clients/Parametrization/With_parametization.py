import pytest
def add(a, b):
    return a + b
@pytest.mark.parametrize("a,b,result", [
    (1, 2, 3),
    (5, 6, 11),
    (10, 1, 11)
])
def test_add(a, b, result):
    assert add(a, b) == result