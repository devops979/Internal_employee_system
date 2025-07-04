from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()

class Employee(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    department = db.Column(db.String(50))

    def to_dict(self):
        return {"id": self.id, "name": self.name, "department": self.department}
