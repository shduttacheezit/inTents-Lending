from sqlalchemy import func
from model import connect_to_db, db, Lender, Camper, Equipment, RentedOut
from datetime import datetime
from server import app, photos

def load_campers(): 
    """ Load campers into database. """

    for row in open("static/campers.csv"):
        row = row.rstrip()

        email, password, first_name, last_name, camper_photo, camper_photo_url  = row.split(",")

        camper = Camper(
                    camper_email=email,
                    password=password,
                    first_name=first_name,
                    last_name=last_name,
                    camper_photo=camper_photo,
                    camper_photo_url=camper_photo_url)

        db.session.add(camper)

    db.session.commit()

def load_lenders():
    """ Load lenders into database. """

    for row in open("static/lenders.csv"):
        row = row.rstrip()
        email, password, first_name, last_name, lender_photo, lender_photo_url  = row.split(",")

        lender = Lender(
                 lender_email=email,
                 password=password,
                 first_name=first_name,
                 last_name=last_name,
                 lender_photo=lender_photo,
                 lender_photo_url=lender_photo_url)

        db.session.add(lender)

    db.session.commit()

def load_equipment():
    """ Load equipment into database. """

    for row in open("static/equipment.csv"):
        row = row.rstrip()
              
        gear_name, category, brand, lender_email, zipcode, gear_photo, gear_photo_url  = row.split(",")

        equipment = Equipment(
                    gear_name=gear_name,
                    category=category,
                    brand=brand,
                    lender_email=lender_email,
                    zipcode=zipcode,
                    gear_photo=gear_photo,
                    gear_photo_url=gear_photo_url)

        db.session.add(equipment)
        

    db.session.commit()


def load_rentedout():
    """ Load what is already rented out into database. """

def set_val_camper_id():
    """Set value for the next camper_id after seeding database"""

    # Get the Max id in the database
    # result = db.session.query(func.max(Camper.camper_id)).one()
    # max_id = int(result[0])

    # # Set the value for the next user_id to be max_id + 1
    # query = "SELECT setval('camper_camper_id_seq', :new_id)"
    # db.session.execute(query, {'new_id': max_id + 1})
    # db.session.commit()

def set_val_lender_id():
    """Set value for the next lender_id after seeding database"""

    # # Get the Max id in the database
    # result = db.session.query(func.max(Lender.lender_id)).one()
    # max_id = int(result[0])

    # # Set the value for the next user_id to be max_id + 1
    # query = "SELECT setval('lenders_lender_id_seq', :new_id)"
    # db.session.execute(query, {'new_id': max_id + 1})
    # db.session.commit()

def set_val_gear_id():
    """Set value for the next gear_id after seeding database"""

    # Get the Max id in the database
    # result = db.session.query(func.max(Equipment.gear_id)).one()
    # max_id = int(result[0])

    # # Set the value for the next id to be max_id + 1
    # query = "SELECT setval('equipment_gear_id_seq', :new_id)"
    # db.session.execute(query, {'new_id': max_id + 1})
    # db.session.commit()


if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    load_campers()
    load_lenders()
    load_equipment()
    load_rentedout()
    set_val_camper_id
    set_val_lender_id
    set_val_gear_id
