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
        if Camper.query.filter_by(email=email).first() is None:
            camper_photo = request.form.get('photo')
            filename = photos.save(request.files['photo'])
            camper_photo = str(photos.path(filename))
            camper_photo_url = photos.url(filename)
            user = Camper(email=email,
                        password=password,
                        first_name=first_name,
                        last_name=last_name,
                        camper_photo=camper_photo,
                        camper_photo_url=camper_photo_url)
            db.session.add(user)
            db.session.commit()
            flash('You are successfully registered!')
            session['camper_id'] = user.camper_id
            return redirect('/camper')
        else:
            flash('Oops, your e-mail already exists as a user. Please log in.')
            return redirect('/login')

    if user_type == 'lender': 
        if Lender.query.filter_by(email=email).first() is None:
            lender_photo = request.form.get('photo')
            filename = photos.save(request.files['photo'])
            lender_photo = str(photos.path(filename))
            lender_photo_url = photos.url(filename)
            user = Lender(email=email,
                        password=password,
                        first_name=first_name,
                        last_name=last_name,
                        lender_photo=lender_photo,
                        lender_photo_url=lender_photo_url)
            db.session.add(user)
            db.session.commit()
            flash('You are successfully registered!')
            session['lender_id'] = user.lender_id
            return redirect('/lender')
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
            sys_email = Camper.query.filter_by(email=email).first()
            if sys_email is None:
                flash('You are not signed up yet! Please register.')
                return redirect('/registration')
            elif email == sys_email.email:
                if password == sys_email.password:
                    flash('You were successfully logged in')
                    session['camper_id'] = sys_email.camper_id
                    return redirect('/camper/%s' % sys_email.camper_id)
            else:
                flash('That is not your password. Try again')
                return redirect('/login-form')
        if user_type == 'lender': 
            sys_email = Lender.query.filter_by(email=email).first()
            if sys_email is None:
                flash('You are not signed up yet! Please register.')
                return redirect('/registration')
            elif email == sys_email.email:
                if password == sys_email.password:
                    flash('You were successfully logged in')
                    session['lender_id'] = sys_email.lender_id
                return redirect('/lender/%s' % sys_email.lender_id)
            else:
                flash('That is not your password. Try again')
                return redirect('/login')

    return render_template('login.html')


@app.route('/logout')
def logout():
    """Log out."""

    if session.get('camper_id') != None:
        del session['camper_id']
    if session.get('lender_id') != None:
        del session['lender_id']

    flash('Logged out.')
    return redirect('/')

@app.route('/dashboard')
def dashboard():
    """Shows dashboard from homepage of user logged in"""

    lender_id = session.get("lender_id")
    camper_id = session.get("camper_id")
    if camper_id: 
        camper = Camper.query.filter_by(camper_id=camper_id).first()
        return render_template("camper.html", camper=camper)
    elif lender_id: 
        lender = Lender.query.filter_by(lender_id=lender_id).first()
        return render_template("lender.html", lender=lender)
    else:
        raise Exception("Oopsies. You have to login first!")


@app.route('/camper/<camper_id>', methods=['GET'])
def camper_dashboard(camper_id):
    """Camper can search through available gear"""

    camper = Camper.query.filter_by(camper_id=camper_id).first()

    lender_id = session.get("lender_id")
    if lender_id:
        raise Exception("No camper logged in!")

    return render_template("camper.html")

@app.route('/camper/<camper_id>', methods=['POST'])
def camper_details(camper_id):
    """Camper can search through equipment available"""

    camper = Camper.query.filter_by(camper_id=camper_id).first()

    equipment = db.session.query.Equipment.all()

    gear_keyword = request.form.get("gear-name-field")
    category = request.form.get("category-type-field")
    brand = request.form.get("brand-type-field")
    zipcode = request.form.get("pac-input")

    lender_id = session.get("lender_id")
    if lender_id:
        raise Exception("No camper logged in!")

    return render_template("camper.html", camper=camper, equipment=equipment)

@app.route('/gear.json', methods=['POST'])
def json_equipment():
    """Dumping equipment data into json dictionary"""

    equipment = []

    equip = db.session.query(Equipment).all()

    for e in equip:
        d = {
        'gear_name': e.gear_name,
        'category' : e.category,
        'brand' : e.brand,
        'zipcode' : e.zipcode}
        equipment.append(d)

    return json.dumps(equipment)


@app.route('/lender/<lender_id>', methods=['GET', 'POST'])
def lender_profile(lender_id):
    """Lender profile to view their posted gear and upload equipment"""

    lender = Lender.query.filter_by(lender_id=lender_id).first()

    camper_id = session.get("camper_id")
    if camper_id:
        raise Exception("Hey there, camper! If you want to lend gear out, please log in separately.")

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
                     lender_id=lender_id,
                     zipcode=zipcode,
                     lender_photo=lender_photo,
                     lender_photo_url=_photo_url)
    db.session.add(gear)
    db.session.commit()
    flash('successfully uploaded your gear!')

    return render_template("lender.html", lender=lender)

@app.route('/equipment/<lender_id>', methods=['GET'])
def lender_equipment(lender_id):
    """Display lender's equipment"""

    equipment = Equipment.query.filter_by(lender_id=lender_id).all()

    camper_id = session.get("camper_id")
    if camper_id:
        raise Exception("Hey there, camper! If you want to lend gear out, please log in separately.")


    return render_template("equipment.html", lender_id=lender_id, equipment=equipment)






if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the
    # point that we invoke the DebugToolbarExtension
    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)


    
    app.run(port=5000, host='0.0.0.0')