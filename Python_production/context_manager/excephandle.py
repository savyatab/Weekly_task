class Demo:
    def __enter__(self):
        print("Start")
        return self
    def __exit__(self,exc_type, exc_val,tb):
        if exc_type:
          print("Error" , exc_val)
        print("Cleanup")
        return True
with Demo():
    print("Inside block")
    1/0
    #tb->traceback
    #enter()->start 
    #if written return false then it gives same output as true but crashes after cleanup
