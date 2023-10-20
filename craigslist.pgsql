DROP DATABASE craigslist_db;
CREATE craigslist_db;
\c craigslist_db;

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category TEXT UNIQUE NOT NULL,
)

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
    category_id INTEGER NOT NULL REFERENCES categories ON DELETE SET NULL,
    region_id INTEGER NOT NULL REFERENCES regions ON DELETE SET NULL,
    location TEXT NOT NULL,
)

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    region_id INTEGER NOT NULL REFERENCES regions ON DELETE SET NULL,
    user_nickname VARCHAR(20) UNIQUE NOT NULL,
)

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL,
)