DROP TABLE IF EXISTS property_listings;

CREATE TABLE property_listings (
    id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    value INT,
    number_of_bedrooms INT,
    year_built INT
);