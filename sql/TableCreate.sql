Drop table if exists yelp;
DROP table if exists google;
DROP table if exists aggregate;
-----------------------------------------------------------------
CREATE table google (
	id INT PRIMARY KEY,
	restaurant_name VARCHAR(1000) NOT NULL, 
	street_address VARCHAR(1000), 
	city TEXT,
	state TEXT,
	zip_code INT, 
	avg_rating TEXT,
	total_ratings INT,
	price_level Text,
	date VARCHAR,
	hour VARCHAR
);
Select * from google;
________________________________________________________________

CREATE table yelp (
	id INT Primary KEY,
	yelp_total_ratings INT,
	yelp_price_level text,
	name text
);

ALTER TABLE "yelp" ADD CONSTRAINT "id" FOREIGN KEY("id")
REFERENCES "google" ("id");

Select * from yelp;
_________________________________________________________________
-- CREATE table aggregate (
-- 	index INT,
-- 	id INT,
-- 	name VARCHAR(1000) NOT NULL, 
-- 	street VARCHAR(1000), 
-- 	city TEXT,
-- 	state TEXT,
-- 	zip_code INT, 
-- 	avg_rating TEXT,
-- 	total_ratings int,
-- 	price_level Text,
-- 	date VARCHAR,
-- 	hour VARCHAR,
-- 	yelp_total_ratings int,
-- 	yelp_price_level TEXT
-- );

-- select * from aggregate;

-- SELECT  ID, SUM(total_ratings + yelp_total_ratings)
-- FROM    aggregate
-- GROUP   BY ID
______________________________________________________________________
drop table if exists aggregate

CREATE TABLE aggregate AS(
	SELECT google.id, google.restaurant_name, google.street_address, google.city, google.state, google.zip_code, google.avg_rating, 
	google.total_ratings, google.price_level, google.date, google.hour, yelp.yelp_total_ratings, yelp.yelp_price_level
    from google, yelp
	);
	
Select * from aggregate;