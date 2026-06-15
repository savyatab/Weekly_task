from pydantic import BaseModel
from typing import Optional
from pydantic import ConfigDict,Field

class User(BaseModel):
    model_config = ConfigDict(strict = True)
    username: str
    age: int = Field(strict =False)
    email: Optional[str] = None
    is_active: bool = False
data = {
    "username":"Savyata",
    "age": 23
}

# create object OUTSIDE the class
obj = User(**data)

print(obj)