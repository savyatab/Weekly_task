from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import declarative_base, sessionmaker

# 1. Create database (SQLite file)
engine = create_engine("sqlite:///practice.db", echo=True)

# 2. Base class
Base = declarative_base()

# 3. Create table model
class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True)
    name = Column(String)
    age = Column(Integer)

    def __repr__(self):
        return f"<User(name={self.name}, age={self.age})>"

# 4. Create table in DB
Base.metadata.create_all(engine)

# 5. Create session
Session = sessionmaker(bind=engine)
session = Session()

# 6. Insert data
user1 = User(name="Ram", age=20)
user2 = User(name="Sita", age=22)

session.add_all([user1, user2])
session.commit()

# 7. Read data
users = session.query(User).all()

for user in users:
    print(user)