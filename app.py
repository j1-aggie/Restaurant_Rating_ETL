...
##A Web application that shows Google Maps around restaurants, using Flask and Google Maps API.

from flask import Flask, render_template, abort, jsonify
from datetime import datetime
import datetime as dt
from dateutil.relativedelta import relativedelta

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
Aggregate = Base.classes.aggregate


#################################################
# Flask Setup
app = flask(__name__)

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

@app.route("/api/v1.0/restaurant_name")
def restaurant_name():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    """Return a list of precipitation amounts"""
    # Query all precipitation amounts
    #rainfall = session.query(Measurement.date, Measurement.prcp).filter(func.strftime("%y-%m-%d", Measurement.date == date).all()
    restaurants = session.query(Aggregate.name).order_by(Aggregate.id.desc()).first()
    restaurants_ratings = restaurants [0]

    restaurants_ratings = restaurants_ratings.id()

    # Perform a query to retrieve the data and precipitation scores.
    restaurants_rating_session = session.query
    (Aggregate.name, Aggregate.ratings).filter(Aggregate.name).all()
    session.close()

 # Create a dictionary from the row data and append to a list of dates and precipitation
    all_restaurants = []
    for name, name in restaurants_rating_session:
        if name != None:
            name_dict = {}
            name_dict[id] = name
            all_restaurants.append(name_dict)

    return jsonify(all_restaurants)

    if __name__ == '__main__':

    #app.run(debug=True)