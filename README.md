# Restaurant_Rating_ETL

Group 2: Project Proposal 10/23/20

Team Members: Jeremy Jones, Reza Abasaltian, Germaine Johnson

Github Repository Link: git@github.com:j1-aggie/Restaurant_Rating_ETL.git

Datasets: Yelp and Google Maps API endpoints

What useful investigation could be done with the final database: The database could serve as a means for rating restaurants, in the future, on their aggregate ratings 
                                                                 versus separate rating systems.

Final database: Will be relational, since rating a restaurant includes several attributes: price, quality of food,
	        cleanliness, and ambience. These attributes are subjective and unique to personal taste and expectations.
		
		

Final Report October 27, 2020        

1) We chose two different datasets: Yelp and Google Maps API. We chose these two to compare if sites were consistently supplying similar data to the public.
2) Each team member was assigned portions of the ETL Project once the proposal was drafted. Web Scraping was done by one team member, another performed 
    the Google Maps API extraction, and another created a Flask application. Jupyter notebooks were created by each team member and upload to the team’s GitHub repository to
    capture individual contributions to the project.  However, one final Jupyter Notebook was created to combine the team's contributions. Combining the individual codes 
    allowed us create a more efficiently working code. The data was later transformed and loaded using Zoom meetings.
3) Transformation of the data was completed as group. The team reviewed data to clean-up any redundancies and to ensure that missing data would not stop the code 
    from running successfully.
4) The type of final database selected best displayed the data and supported our narrative as to how restaurant ratings could be presented as an aggregate.  A Flask 
    application created by the team allowed our database to be queried and return results in a JSON format.
5) The schema of the tables in the final database was created using pgAdmin4 and SQL to display the data as a relational data set.
6) In Summary, we envision the database being used to rate restaurants in an aggregate manner. The aggregate, yelp, and google restaurant ratings show the same top 4 restaurants
    (see image folder). However, once you compare aggregate ratings beyond the top 4 restaurants to Google and Yelp ratings, we see different ranking of restaurants.

