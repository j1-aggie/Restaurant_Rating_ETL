...
##A Web application that shows Google Maps around restaurants, using Flask and Google Maps API.

# import dependencies and setup
import numpy as np

from flask import Flask
from flask import Flask, render_template, abort
from flask import Flask, jsonify

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

# import database login credentials
from db_key import user, password
#from config import password

#################################################
# Database Setup
#################################################
engine = create_engine(f'postgresql://{user}:{password}@localhost:5432/restaurant_db')

# reflect an existing database into a new model
Base = automap_base()

# reflect the tables
Base.prepare(engine, reflect=True)

# We can view all of the classes that automap found
print(Base.classes.keys())

# Save reference to the tables
Google = Base.classes.google
Yelp = Base.classes.yelp
Combined = Base.classes.combined_rating

#################################################
# Flask Setup
app = Flask(__name__)

#################################################
# Flask Routes
#################################################

@app.route("/")
def welcome():
    """List all available api routes."""
    return (
        f"<!DOCTYPE html>"
        f"<html lang='en-us'>"
        f"<meta charset='UTF-8'><title>Restaurant API</title>"
        f"<p style='color:blue'>Welcome to the Restaurant API app!</p><br/>"
        f"<u>Available Routes:</u><br/>"
        f"<a href='/api/v1.0/google' target='_blank'>/api/v1.0/google</a><br/>"
        f"<a href='/api/v1.0/yelp' target='_blank'>/api/v1.0/yelp</a><br/>"
        f"<a href='/api/v1.0/aggregate' target='_blank'>/api/v1.0/aggregate</a><br/>"
    )

@app.route("/api/v1.0/google")
def google():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    """Return a list of restaurants listing imported from google api"""
    # Query all google restaurants listing
    restaurant_qry = session.query(Google.id, Google.restaurant_name, Google.street_address, 
                                    Google.total_ratings, Google.avg_rating, Google.price_level).all()

    # close the session to end the communication with the database
    session.close()

    # Create a dictionary from the row data and append to a list of all restaurants
    google_listing = []
    for restaurant in restaurant_qry:
        restaurant_dict = {}
        restaurant_dict['id'] = restaurant.id
        restaurant_dict['name'] = restaurant.restaurant_name
        restaurant_dict['street address'] = restaurant.street_address
        restaurant_dict['total ratings'] = restaurant.total_ratings
        restaurant_dict['average rating'] = round(float(restaurant.avg_rating),2)
        if restaurant.price_level != "NA":
            restaurant_dict['price level'] = round(float(restaurant.price_level),1)
        else:
            restaurant_dict['price level'] = "NA"
        google_listing.append(restaurant_dict)

    return jsonify(google_listing)


@app.route("/api/v1.0/yelp")
def yelp():
    """Return a list of restaurant listing imported from yelp web scraping"""

    # Open a communication session with the database
    session = Session(engine)

    # Query all yelp restaurants
    yelp_qry = session.query(Google.id, Google.restaurant_name, 
                            Yelp.yelp_total_ratings, Yelp.yelp_average_rating, Yelp.yelp_price_level).join(Yelp).all()

    # close the session to end the communication with the database
    session.close()

    # Create a dictionary from the row data and append to a list of all restaurants
    yelp_listing = []
    for yelp in yelp_qry:
        restaurant_dict = {}
        restaurant_dict['id'] = yelp.id
        restaurant_dict['name'] = yelp.restaurant_name
        restaurant_dict['total ratings'] = yelp.yelp_total_ratings
        restaurant_dict['average rating'] = round(float(yelp.yelp_average_rating),2)
        restaurant_dict['price level'] = float(len(yelp.yelp_price_level))
        yelp_listing.append(restaurant_dict)

    return jsonify(yelp_listing)


@app.route("/api/v1.0/aggregate")
def aggregate():
    """Return a list of restaurant data"""

    # Open a communication session with the database
    session = Session(engine)

    # Query all restaurants for an aggregate google and yelp calculations
    aggregate_qry = session.query(Google.id, Google.restaurant_name, 
                            Combined.total_ratings, Combined.average_rating, Combined.delta_rating,
                            Combined.average_price_level).join(Combined).all()


    # close the session to end the communication with the database
    session.close()

    # Create a dictionary from the row data and append to a list of all_passengers
    aggregate_listing = []
    for aggregate in aggregate_qry:
        restaurant_dict = {}
        restaurant_dict['id'] = aggregate.id
        restaurant_dict['name'] = aggregate.restaurant_name
        restaurant_dict['total ratings'] = aggregate.total_ratings
        restaurant_dict['average rating'] = round(float(aggregate.average_rating),2)
        restaurant_dict['delta rating'] = round(float(aggregate.delta_rating),2)
        restaurant_dict['average price level'] = round(float(aggregate.average_price_level),2)
        aggregate_listing.append(restaurant_dict)

    return jsonify(aggregate_listing)


# This final if statement simply allows us to run in "Development" mode, which 
# means that we can make changes to our files and then save them to see the results of 
# the change without restarting the server.
if __name__ == "__main__":
    app.run(debug=True)
