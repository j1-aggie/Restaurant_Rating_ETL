...
##A Web application that shows Google Maps around restaurants, using Flask and Google Maps API.

from flask import Flask
from flask import Flask, render_template, abort, jsonify


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
        f"/api/v1.0/restaurant_name<br/>"
    )

@app.route("/api/v1.0/restaurants")
def restaurants():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    """Return a list of restaurants"""
    # Query all restaurants within zip
    
    restaurants = session.query(aggregate.id, aggregate.restaurant_name, aggregate.total_ratings, aggregate.yelp_total_ratings).all()
    

    session.close()

    # Perform a query to retrieve the data and restaurants.
    all_restaurants = []
    for restaurant, id, restaurant_name, total_ratings, yelp_total_ratings in restaurants:
       restaurant_dict = {}
       restaurant_dict["id"] = id
       restaurant_dict["restaurant_name"] = restaurant_name
       restaurant_dict["total_ratings"] = total_ratings
       restaurant_name["yelp_total_ratings"] = yelp_total_ratings
       all_restaurants.append(restaurant_dict)

    return jsonify(all_restaurants)


 

    if __name__ == '__main__':

        app.run(debug=True)