SELECT * FROM public."aggregate"

DROP table if exists aggregate;

CREATE table google (
	id INT PRIMARY KEY,
	restaurant_name VARCHAR(1000) NOT NULL, 
	street_address VARCHAR(1000), 
	city TEXT,
	state TEXT,
	zip_code INT, 
	avg_rating TEXT,
	total_ratings TEXT,
	price_level Text,
	date VARCHAR,
	hour VARCHAR
);

select * from google;

CREATE table yelp (
	id INT PRIMARY KEY,
	restaurant_name VARCHAR(1000) NOT NULL, 
	street_address VARCHAR(1000), 
	city TEXT,
	state TEXT,
	zip_code INT, 
	avg_rating TEXT,
	total_ratings TEXT,
	price_level Text,
	date VARCHAR,
	hour VARCHAR
);

Select * From yelp;

-- CREATE table aggregate (
-- 	id INT PRIMARY KEY,
-- 	restaurant_name VARCHAR(1000) NOT NULL, 
-- 	street_address VARCHAR(1000), 
-- 	city TEXT,
-- 	state TEXT,
-- 	zip_code INT, 
-- 	avg_rating TEXT,
-- 	total_ratings TEXT,
-- 	price_level Text,
-- 	date VARCHAR,
-- 	hour VARCHAR
-- );

-- select * from aggregate;

SELECT google.restaurant_name, google.total_ratings, yelp.price_level,
yelp.city
FROM google
JOIN yelp
ON google.restaurant_name = yelp.restaurant_name;