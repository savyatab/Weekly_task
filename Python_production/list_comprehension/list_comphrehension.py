# list comprehension
#provides a shorter syntax when you need to create a new list based on a value of existing list

# basic list comprehension(mapping) Used to transform each element in a sequence into a new value.
numbers = [2,4,6,8,10]
squares =[ n * n for n in numbers]
print(squares)


#filtering list comprehension (keeps only elements that satisfy a condition)
numbers = [1,2,3,4,5]
evens = [n for n in numbers if n % 2 == 0]
print(evens)

#conditional( if/else) comprehension
numbers =[4,5,6,7,8,9]
num= ['even' if n % 2 == 0 else 'odd' for n in numbers]
print(num)

#nested list comprehension /flattening(works wwith multi dimensional list that is matrix)
matrix =[
    [4,5],
    [5,6]
]
flat =[num for rows in matrix for num in rows]
print(flat)

#function based list comprehension
def comp(text):
    return text.strip().lower()
item = ['HEllo','worLD']
new_data = [comp(x) for x in item]
print(new_data)

