# def test_1():
#     db =connect_database()
# ef test2():
#     db =connect_database()
# # ->repeated setup everywhere 

#with fixture
import pytest

@pytest.fixture
def sample_user():
    return {
        "name": "Sab",
        "age": 20
    }

def test_user_name(sample_user):
    assert sample_user["name"] == "Sab"
    #assert-> is a debugging tool used to check if something is True or False
    