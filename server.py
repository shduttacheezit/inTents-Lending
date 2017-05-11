from jinja2 import StrictUndefined

from flask import Flask, jsonify, render_template, redirect, request, flash, session
from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db, Lender, Camper, Equipment, RentedOut
from datetime import datetime


app = Flask(__name__)

# Required to use Flask sessions and the debug toolbar
app.secret_key = "ABC"

# ******Jinja fix!
# Normally, if you use an undefined variable in Jinja2, it fails
# silently. This is horrible. Fix this so that, instead, it raises an
# error.
app.jinja_env.undefined = StrictUndefined


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
            user = Camper(email=email,
                        password=password,
                        first_name=first_name,
                        last_name=last_name,
                        camper_photo=camper_photo)
            db.session.add(user)
            db.session.commit()
            flash('You were successfully added')
        else:
            flash('Oops, you are already in the database! Try again.')
            return redirect('/registration')

    if user_type == 'lender': 
        if Lender.query.filter_by(email=email).first() is None:
            lender_photo = request.form.get('photo')
            user = Lender(email=email,
                        password=password,
                        first_name=first_name,
                        last_name=last_name,
                        lender_photo=lender_photo)
            db.session.add(user)
            db.session.commit()
            flash('You were successfully added')
        else:
            flash('Oops, you are already in the database! Try again.')
            return redirect('/registration')


    return redirect('/')


@app.route('/login', methods=['GET', 'POST'])
def login():
    """Allow user to login with password"""

    email = request.form.get('email')
    password = request.form.get('password')

    sys_email = User.query.filter_by(email=email).first()

    if request.method == 'POST':
        if sys_email is None:
            flash('Invalid credentials')
            return redirect('/login-form')
        elif email == sys_email.email:
            if password == sys_email.password:
                flash('You were successfully logged in')
                session["user_id"] = sys_email.user_id
                return redirect('/users/%s' % sys_email.user_id)
            else:
                flash('That is not your password. Try again')
                return redirect('/login-form')

    return render_template('login.html')


@app.route('/logout')
def logout():
    """Log out."""

    del session['user_id']
    flash('Logged out.')
    return redirect('/')


@app.route('/camper/<camper_id>', methods=['GET'])
def camper_dashboard(camper_id):
    """Camper dashboard"""


    return render_template("camper.html")

@app.route('/camper/<camper_id>', methods=['POST'])
def camper_details(camper_id):
    """Camper dashboard - process"""


    return render_template("camper.html")


@app.route('/lender/<lender_id>', methods=['GET'])
def lender_profile(lender_id):
    """Lender Dashboard"""


    return render_template("lender.html")


@app.route('/lender/<lender_id>', methods=['POST'])
def lender_profile_details(lender_id):
    """Lender Dashboard - """



    return redirect("/movies/%s" % movie_id)






if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the
    # point that we invoke the DebugToolbarExtension
    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)


    
    app.run(port=5000, host='0.0.0.0')