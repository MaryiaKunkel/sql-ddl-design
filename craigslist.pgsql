DROP DATABASE craigslist_db;
CREATE craigslist_db;
\c craigslist_db;

CREATE TABLE craigslist(
    id SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL REFERENCES categories ON DELETE SET NULL,
)

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category TEXT UNIQUE NOT NULL,
)

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
    category_id INTEGER NOT NULL REFERENCES categories ON DELETE SET NULL,
    post_region TEXT NOT NULL,
    post_location TEXT NOT NULL,
)

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    user_region TEXT NOT NULL,
    user_nickname VARCHAR(20) UNIQUE NOT NULL,
    is_sold BOOLEAN DEFAULT false,
)
