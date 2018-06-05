DROP DATABASE IF EXISTS shows;
CREATE DATABASE shows;
\c shows;

CREATE TABLE show (
 show_id INTEGER PRIMARY KEY NOT NULL,
 name VARCHAR(255),
 description TEXT ,
 release_year INTEGER,
 genres VARCHAR(255),
 network VARCHAR(255)
);

CREATE TABLE episode (
 episode_id INTEGER PRIMARY KEY NOT NULL,
 show_id INTEGER NOT NULL REFERENCES show(show_id),
 season INTEGER,
 number INTEGER,
 "date" DATE
);

CREATE TABLE "user" (
 user_id INTEGER PRIMARY KEY NOT NULL,
 registration_date DATE CHECK(registration_date <= CURRENT_DATE),
 firstname VARCHAR(255),
 lastname VARCHAR(255),
 email VARCHAR(255) CHECK(email LIKE '%@%'),
 password TEXT
);

CREATE TABLE user_follow_show (
 user_id INTEGER NOT NULL REFERENCES "user"(user_id),
 show_id INTEGER NOT NULL REFERENCES show(show_id),
 follow_date DATE
);

CREATE TABLE user_rate_show (
 user_id INTEGER NOT NULL REFERENCES "user"(user_id),
 show_id INTEGER NOT NULL REFERENCES show(show_id),
 rating INTEGER,
 rating_date DATE
);

CREATE TABLE user_watch_episode (
 user_id INTEGER NOT NULL REFERENCES "user"(user_id),
 episode_id INTEGER NOT NULL REFERENCES episode(episode_id),
 watch_date DATE CHECK(watch_date <= CURRENT_DATE)
);

