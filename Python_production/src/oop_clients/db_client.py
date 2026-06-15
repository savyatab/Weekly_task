import sqlite3
class DBClient:
    def __init__(self, db_name="users.db"):   #Opens a connection to the database file If file doesn’t exist → SQLite creates it automatically
        self.conn = sqlite3.connect(db_name)
        self.cur = self.conn.cursor()  #cursor is used to run sql queries 
    def run(self, query, values=()):
        self.cur.execute(query, values)
        self.conn.commit()   #Saves changes to database Without this, INSERT/UPDATE won’t be permanent

    def fetch_all(self, query):
        return self.cur.execute(query).fetchall()
db = DBClient()

db.run("CREATE TABLE IF NOT EXISTS users (id INTEGER, name TEXT)")
db.run("INSERT INTO users VALUES (?, ?)", (1, "Ram"))
db.run("INSERT INTO users VALUES (?, ?)", (2, "Savyata"))


rows = db.fetch_all("SELECT * FROM users")
print(rows)