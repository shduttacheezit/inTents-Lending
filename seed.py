from model import connect_to_db, db, Lender, Camper, Equipment, RentedOut
from datetime import datetime
from server import app, photos, manuals

def load_campers(): 
    """ Load campers into database. """

def load_lenders():
    """ Load lenders into database. """

def load_equipment():
    """ Load equipment into database. """

def load_rentedout():
    """ Load what is already rented out into database. """




if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()