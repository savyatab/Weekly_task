from src.transform import transform
def test_transform():
    #
    data =[{ 
        "id": 1,
        "name":"Hari"
    }]
    result =transform(data)
    assert result == [
        {"id": 1, "name": "hari"}
    ]