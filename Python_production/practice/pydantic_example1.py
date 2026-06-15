#pip install pydantic
#pydantic->It checks whether your data is correct (type, format, structure) before your program uses it.
from pydantic import BaseModel  #basemodel->is a predefined class in Pydantic,must inherit from it
class User(BaseModel): 
    id :int
    name :str
data ={
    "id": 1,
    "name": "Raju"
}
user = User(**data)
print(user)