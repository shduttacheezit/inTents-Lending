
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):

    __tablename__ = "users"

    user_email = db.Column(db.String(255), nullable=False, primary_key=True)
    password = db.Column(db.String(64), nullable=False)
    lender_id = db.Column(db.Integer, autoincrement=True, nullable=False)
    camper_id = db.Column
    first_name = db.Column(db.String(64), nullable=False)
    last_name = db.Column(db.String(64), nullable=False)
    user_photo = db.Column(db.String(255), nullable=False)
    user_photo_url = db.Column(db.String(255), nullable=False)

    lender = db.relationship("Lender")
    camper = db.relationship("Camper")

class Lender(db.Model):

    __tablename__ = "lenders"

    lender_id = db.Column(db.Integer, nullable=False, autoincrement=True, primary_key=True)
    # lender_email = db.Column(db.String(255), nullable=False, primary_key=True)
    # password = db.Column(db.String(64), nullable=False)
    # first_name = db.Column(db.String(64), nullable=False)
    # last_name = db.Column(db.String(64), nullable=False)
    # lender_photo = db.Column(db.String(255), nullable=False)
    # lender_photo_url = db.Column(db.String(255), nullable=False)

    equipment = db.relationship("Equipment")
    rentedout = db.relationship("RentedOut")

class Camper(db.Model):

    __tablename__ = "campers"

    camper_id = db.Column(db.Integer, nullable=False, autoincrement=True, primary_key=True)
    # camper_email = db.Column(db.String(255), nullable=False, primary_key=True)
    # password = db.Column(db.String(64), nullable=False)
    # first_name = db.Column(db.String(64), nullable=False)
    # last_name = db.Column(db.String(64), nullable=False)
    # camper_photo = db.Column(db.String(255), nullable=False)
    # camper_photo_url = db.Column(db.String(255), nullable=False)

    rentedout = db.relationship("RentedOut")

class Equipment(db.Model):

    __tablename__ = "equipment"

    gear_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    gear_name = db.Column(db.String(255), nullable=False)
    category = db.Column(db.String(64), nullable=False)
    brand = db.Column(db.String(64), nullable=False)
    lender_id = db.Column(db.Integer, db.ForeignKey('lenders.lender_id'), nullable=False)
    zipcode = db.Column(db.Integer, nullable=False)
    gear_photo = db.Column(db.String(255), nullable=False)
    gear_photo_url = db.Column(db.String(255), nullable=False)
    available = db.Column(db.Boolean, unique=False, nullable=False, default=True)

    lender = db.relationship("Lender")

class RentedOut(db.Model):

    __tablename__ = "rentedout"

    rented_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    gear_id = db.Column(db.Integer, db.ForeignKey('equipment.gear_id'), nullable=False)
    lender_id = db.Column(db.Integer, db.ForeignKey('lenders.lender_id'), nullable=False)
    camper_id = db.Column(db.Integer, db.ForeignKey('campers.camper_id'), nullable=False)
    start_date = db.Column(db.DateTime, nullable=False)
    end_date = db.Column(db.DateTime, nullable=False)

    camper = db.relationship("Camper")
    lender = db.relationship("Lender")
    gear = db.relationship("Equipment")

def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our database.
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres:///database'
    app.config['SQLALCHEMY_ECHO'] = False
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":

    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    # So that we can use Flask-SQLAlchemy, we'll make a Flask app.

    from flask import Flask
    app = Flask(__name__)


    connect_to_db(app)
    print "Connected to DB."
    db.create_all()