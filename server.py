from jinja2 import StrictUndefined
from flask import Flask, jsonify, render_template, redirect, request, flash, session
from flask_debugtoolbar import DebugToolbarExtension
from flask_uploads import UploadSet, configure_uploads, IMAGES, patch_request_class

from model import connect_to_db, db, Lender, Camper, Equipment, RentedOut
from datetime import datetime
import collections


app = Flask(__name__)

# Required to use Flask sessions and the debug toolbar
app.secret_key = "ABC"

# ******Jinja fix!
# Normally, if you use an undefined variable in Jinja2, it fails
# silently. This is horrible. Fix this so that, instead, it raises an
# error.
app.jinja_env.undefined = StrictUndefined

photos = UploadSet('photos', IMAGES)

app.config['UPLOADED_PHOTOS_DEST'] = 'static/images/profpics'
app.config['UPLOADED_PHOTOS_ALLOW'] = set(['jpg', 'png', 'jpeg', 'gif', 'JPG'])

configure_uploads(app, (photos))
patch_request_class(app)


@app.route('/')
def index():
    """Homepage."""


    return render_template("homepage.html")

@app.route('/registration', methods=['GET'])
def registration_form():
    """Shows registration form."""

    return render_template("registration.html")


@app.route('/registration', methods=['POST'])
def registration_process():
    """Processes registration form."""

    user_type = request.form.get('user_type')
    email = request.form.get('email')
    password = request.form.get('password')
    first_name = request.form.get('first_name')
    last_name = request.form.get('last_name')

    if user_type == 'camper': 
        if Camper.query.filter_by(camper_email=email).first() is None:
            camper_photo = request.form.get('photo')
            filename = photos.save(request.files['photo'])
            camper_photo = str(photos.path(filename))
            camper_photo_url = photos.url(filename)
            camper = Camper(camper_email=email,
                        password=password,
                        first_name=first_name,
                        last_name=last_name,
                        camper_photo=camper_photo,
                        camper_photo_url=camper_photo_url)
            db.session.add(camper)
            db.session.commit()
            flash('You are successfully registered!')
            session['camper_email'] = camper.camper_email
            return redirect('/camper/%s' % camper.camper_email)
        else:
            flash('Oops, your e-mail already exists as a user. Please log in.')
            return redirect('/login')

    if user_type == 'lender': 
        if Lender.query.filter_by(lender_email=email).first() is None:
            lender_photo = request.form.get('photo')
            filename = photos.save(request.files['photo'])
            lender_photo = str(photos.path(filename))
            lender_photo_url = photos.url(filename)
            lender = Lender(lender_email=email,
                        password=password,
                        first_name=first_name,
                        last_name=last_name,
                        lender_photo=lender_photo,
                        lender_photo_url=lender_photo_url)
            db.session.add(lender)
            db.session.commit()
            flash('You are successfully registered!')
            session['lender_email'] = lender.lender_email
            return redirect('/lender/%s' % lender.lender_email)
        else:
            flash('Oops, your e-mail already exists as a user. Please log in.')
            return redirect('/login')


    return redirect('/')


@app.route('/login', methods=['GET', 'POST'])
def login():
    """Allow user to login with password"""

    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        user_type = request.form.get('user_type')

        if user_type == 'camper':
            camper = Camper.query.filter_by(camper_email=email).first()
            if camper is None:
                flash('You are not signed up yet! Please register.')
                return redirect('/registration')
            elif email == camper.camper_email:
                if password == camper.password:
                    flash('You were successfully logged in')
                    session['camper_email'] = camper.camper_email
                    return redirect('/camper/%s' % camper.camper_email)
                else:
                    flash('That is not your password. Try again')
                    return redirect('/login')
        if user_type == 'lender': 
            lender = Lender.query.filter_by(lender_email=email).first()
            if lender is None:
                flash('You are not signed up yet! Please register.')
                return redirect('/registration')
            elif email == lender.lender_email:
                if password == lender.password:
                    flash('You were successfully logged in')
                    session['lender_email'] = lender.lender_email
                    return redirect('/lender/%s' % lender.lender_email)
                else:
                    flash('That is not your password. Try again')
                    return redirect('/login')

    return render_template('login.html')


@app.route('/logout')
def logout():
    """Log out."""

    if session.get('camper_email') != None:
        del session['camper_email']
    if session.get('lender_email') != None:
        del session['lender_email']

    flash('Logged out.')
    return redirect('/')

@app.route('/dashboard')
def dashboard():
    """Shows dashboard from homepage of user logged in"""

    lender_email = session.get("lender_email")
    camper_email = session.get("camper_email")
    if camper_email: 
        camper = Camper.query.filter_by(camper_email=camper_email).first()
        return render_template("camper.html", camper=camper)
    elif lender_email: 
        lender = Lender.query.filter_by(lender_email=lender_email).first()
        return render_template("lender.html", lender=lender)
    else:
        raise Exception("Oopsies. You have to login first!")


@app.route('/camper/<camper_email>', methods=['GET'])
def camper_dashboard(camper_email):
    """Camper can search through available gear"""

    camper = Camper.query.filter_by(camper_email=camper_email).first()

    lender_email = session.get("lender_email")
    if lender_email:
        raise Exception("No camper logged in!")

    return render_template("camper.html", camper=camper)

@app.route('/gear.json', methods=['POST'])
def search_gear():
    """Camper can search through equipment available"""

    gear_keyword = request.form.get("gear_name")
    category = request.form.get("category")
    brand = request.form.get("brand")
    # zipcode = request.form.get("zipcode")
    if category == "All Categories" and brand == "All Brands":
        equipSearch = Equipment.query.filter(Equipment.gear_name.contains(gear_keyword)).all()
    elif category != "All Categories" and brand == "All Brands":
        equipSearch = Equipment.query.filter(Equipment.category == category, Equipment.gear_name.contains(gear_keyword)).all()
    elif category == "All Categories" and brand != "All Brands":
        equipSearch = Equipment.query.filter(Equipment.brand == brand, Equipment.gear_name.contains(gear_keyword)).all()
    else:
        equipSearch = Equipment.query.filter(Equipment.category == category, Equipment.brand == brand, Equipment.gear_name.contains(gear_keyword)).all()

    equipment = []

    print equipSearch

    for e in equipSearch:
        d = {
        'gear_id' : e.gear_id,
        'gear_name': e.gear_name,
        'category' : e.category,
        'brand' : e.brand,
        'lender_email' : e.lender_email,
        'gear_photo_url' : e.gear_photo_url,
        'zipcode' : e.zipcode
        }
        equipment.append(d)

    return jsonify(equipment)

@app.route('/lender/<lender_email>', methods=['GET', 'POST'])
def lender_profile(lender_email):
    """Lender profile to view their posted gear and upload equipment"""

    lender = Lender.query.filter_by(lender_email=lender_email).first()

    camper_email = session.get("camper_email")
    if camper_email:
        raise Exception("Hey there, camper! If you want to lend gear out, please log in separately.")

    if request.method == 'GET':
        return render_template("lender.html", lender=lender)
    else:
        category = request.form.get('category_type')
        brand = request.form.get('brand_type')
        gear_name = request.form.get('gear_name')
        zipcode = request.form.get('zipcode')
        gear_photo = request.form.get('photo')
        filename = photos.save(request.files['photo'])
        gear_photo = str(photos.path(filename))
        gear_photo_url = photos.url(filename)


        gear = Equipment(gear_name=gear_name,
                         category=category,
                         brand=brand,
                         lender_email=lender_email,
                         zipcode=zipcode,
                         gear_photo=gear_photo,
                         gear_photo_url=gear_photo_url)
        db.session.add(gear)
        db.session.commit()
        flash('successfully uploaded your gear!')

        return redirect("/equipment/%s"%lender.lender_email)

@app.route('/equipment/<lender_email>', methods=['GET'])
def lender_equipment(lender_email):
    """Display lender's equipment"""

    equipment = Equipment.query.filter_by(lender_email=lender_email).all()

    camper_email = session.get("camper_email")
    if camper_email:
        raise Exception("Hey there, camper! If you want to lend gear out, please log in separately.")


    return render_template("equipment.html", lender_email=lender_email, equipment=equipment)

@app.route('/equipment_details/<gear_id>', methods=['GET'])
def equipment_details(gear_id):
    """Display gear details"""

    gear = Equipment.query.filter_by(gear_id=gear_id).first()




    return render_template("gear_details.html", gear=gear)





if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the
    # point that we invoke the DebugToolbarExtension
    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)

    # # Use the DebugToolbar
    DebugToolbarExtension(app)


    
    app.run(port=5000, host='0.0.0.0')