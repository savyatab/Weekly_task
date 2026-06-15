def simple_generator():
    yield 1
    yield 2
    yield 3
for value in simple_generator():
    print(value)