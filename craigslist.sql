-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE users
(
id SERIAL PRIMARY KEY    
name TEXT, 
encrypted_password TEXT, 
preferred_region_id INTEGER REFERENCES regions,
);


CREATE TABLE regions
(
id SERIAL PRIMARY KEY
name TEXT    
);

CREATE TABLE posts
(
id SERIAL PRIMARY KEY
title TEXT,
text TEXT,
location TEXT,
user_id INTEGER REFERENCES users,
region_id INTEGER REFERENCES regions,
category_id INTEGER REFERENCES categories
);

CREATE TABLE categories
(
id SERIAL PRIMARY KEY    
name TEXT
);