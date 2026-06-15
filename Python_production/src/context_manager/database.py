from contextlib import contextmanager

@contextmanager
def database_conn():
    conn ="db_connection_open"
    print("Openning db conection")

    try:
        yield conn
    finally:
        print("cleanup")
with database_conn() as db:
    print("querying db",db)