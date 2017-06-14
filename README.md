# inTentsLending 1.0

![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/homepage.png?raw=true "Homepage")

### What is inTentsLending?
inTentsLending is a web application that enables peer-to-peer sharing of camping gear. Lenders may upload their gear they would like to lend out.  Campers may search via their geolocation, brands, categories, keywords, and a different location and borrow desired items for a specific amount of time. This project's goal was to contribute to the information technology world's recent momentum in sharing economy, as collaborative consumption has become a great way to live and consume sustainably.

## Table of Contents
* [Technologies](#technologies)
* [Features](#features)
* [inTentsLending 2.0](#version2)
* [About The Developer](#aboutthedeveloper)

## <a name="technologies"></a>Technologies
__Backend:__ Python, Flask, PostgreSQL, SQLAlchemy<br>
__Frontend:__ Javascript, jQuery, AJAX, Jinja2, HTML5, CSS3<br>
__APIs:__ Google Maps Geolocation API, Google Maps Geocoding API<br>
__Deployment:__ TBA<br>

## <a name="features"></a>Features

From the homepage, the user can either register or login. <br>
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/register.png?raw=true "Register")<br>
The passwords are hashed with bcrypt before they are stored in the database.<br>
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/login.png?raw=true "Login")<br>
Once a camper logs in, the camper can see their dashboard, which geolocates the user. From here, the camper can search for gear. The search results will take a gear keyword, brand, category, or a desired zipcode. <br>
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/camper_dashboard.png?raw=true "Camper Dashboard")<br>
The camper can click on each result icon to get basic info on the gear item in an info window. Underneath the info, there is the link to borrow. <br>
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/GoogleMap_infowindow.png?raw=true "Infowindow")
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/borrow_box.png?raw=true "Borrow")<br>
The camper inputs the dates they would like to borrow the gear. They can then view their other borrowed gear in carousel, and return from there. <br>
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/rental_dates.png?raw=true "Rental Dates")
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/rentals_carousel.png?raw=true "All Rentals")<br>
The user could also go to the "Your Gear" tab and return their gear from there. <br>
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/return_option.png?raw=true "Return")<br>
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/return_complete.png?raw=true "Return")<br>
When the lender logs in, their dashboard consists of an option to upload new equipment, <br>
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/lender_dashboard.png?raw=true "Lender Dashboard")<br>
And also view their equipment! <br>
![](https://github.com/shduttacheezit/inTents-Lending_HackbrightProject/blob/master/read-me-images/lender_equipment.png?raw=true "Lender Equipment")<br>


## <a name="version2"></a>inTentsLending Version 2.0

In Version 2.0, there will be the ability to sign on using Facebook and GMail, so as to be able to lend and borrow through one's network to encourage trust and safety among borrows and lenders. There will also be a way to rate each gear item, the lender, as well as the borrower, so there is accountability among the users of this application.

## <a name="aboutthedeveloper"></a>About the Developer
Shilpa is a software engineer and Hackbright Academy graduate, with a background in public health and research. inTentsLending is her first fullstack web-application and she enjoyed every bit of it. Learning is a passion, and she is very grateful for the lessons learned through this project. Her favorite part was working with complex queries and developing a strong relational database with SQLAlchemy and PostgreSQL. She enjoyed the ups and downs of creating this application and looks forward to coding more projects. Shilpa is excited to progress in her software engineering career as a fullstack developer, work on more projects, and learn as much as she can. 

[LinkedIn](http://www.linkedin.com/in/shilpadutta)
