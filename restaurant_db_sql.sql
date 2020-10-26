--DROP table if exists google;
--Drop table if exists yelp;
--DROP table if exists combined_rating;

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

CREATE table yelp (
	id INT Primary KEY,
	yelp_total_ratings INT,
	yelp_average_rating FLOAT,
	yelp_price_level text
);

CREATE table combined_rating (
	id INT Primary KEY,
	total_ratings INT,
	average_rating Float,
	delta_rating Float,
	average_price_level Float
);

ALTER TABLE "yelp" ADD CONSTRAINT "id" FOREIGN KEY("id")
REFERENCES "google" ("id");

ALTER TABLE "combined_rating" ADD CONSTRAINT "id" FOREIGN KEY("id")
REFERENCES "google" ("id");

select * from google;	
select * from yelp;
select * from combined_rating;