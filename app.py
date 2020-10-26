...
##A Web application that shows Google Maps around restaurants, using Flask and Google Maps API.

from flask import Flask
from flask import Flask, render_template, abort
from flask import Flask, jsonify

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from config import password

#################################################
# Database Setup
#################################################
engine = create_engine(f'postgresql://postgres:{password}@localhost:5432/restaurant_db')

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(engine, reflect=True)

# We can view all of the classes that automap found
#Base.classes.keys()

# Save reference to the tables
google = Base.classes.google


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
        f"Welcome to the Restaurant App API!<br>"
        f"Available Route:<br/>"
        f"/api/v1.0/restaurant_name"
        f"/api/v1.0/ratings"
    )

@app.route("/api/v1.0/restaurants")
def restaurant_name():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    """Return a list of restaurants"""
    # Query all restaurants within zip
    
    restaurants = session.query(aggregate.restaurant_name).all()
    

    session.close()

    # Convert list of tuples into normal list
    all_restaurants = list(np.ravel(restaurants))
    print(all_restaurants)
    return jsonify(all_restaurants)

@app.route("/api/v1.0/ratings")
def ratings():
    """Return a list of restaurant data"""

    # Open a communication session with the database
    session = Session(engine)

    # Query all restaurants
    results = session.query(aggregate).all()

    # close the session to end the communication with the database
    session.close()

    # Create a dictionary from the row data and append to a list of all_passengers
    all_ratings = []
    for restaurant_name in results:
        restaurant_dict = {}
        restaurant_dict["name"] = restaurant_name.name
        restaurant_dict["total_ratings"] = restaurant_name.total_ratings
        restaurant_dict["yelp_total_ratings"] = restaurant_name.yelp_total_ratings
        all_ratings.append(restaurant_dict)

    return jsonify(all_ratings)


    if __name__ == '__main__':

        app.run(debug=True)