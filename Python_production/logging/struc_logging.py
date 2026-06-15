import logging #used for production-style logging instead of print()
import json   #converts python dictionaries into json string

logging.basicConfig(level =logging.INFO)  #basicconfig->setup basic loggings
def log_event(event,data):
    log_entry ={
        "event": event,
        "data": data
    }
    logging.info(json.dumps(log_entry)) #json dumps->converts the python object into json string

log_event("user_login",{"user_id":1,"status":"success"})
log_event("api_error", {"endpoint": "/data", "code": 500})