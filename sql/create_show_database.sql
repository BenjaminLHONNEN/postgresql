DROP DATABASE IF EXISTS shows;
CREATE DATABASE shows;
\c shows;

CREATE TABLE show (
 show_id INTEGER PRIMARY KEY NOT NULL,
 name VARCHAR(255) NOT NULL,
 description TEXT NOT NULL,
 release_year INTEGER NOT NULL,
 genres VARCHAR(255) NOT NULL,
 network VARCHAR(255) NOT NULL
);

CREATE TABLE episode (
 episode_id INTEGER PRIMARY KEY NOT NULL,
 show_id INTEGER NOT NULL REFERENCES show(show_id),
 season INTEGER NOT NULL,
 number INTEGER NOT NULL,
 timestamp TIMESTAMP NOT NULL
);

CREATE TABLE "user" (
 user_id INTEGER PRIMARY KEY NOT NULL,
 registration_timestamp TIMESTAMP NOT NULL,
 firstname VARCHAR(255) NOT NULL,
 lastname VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL,
 password VARCHAR(255) NOT NULL
);

CREATE TABLE user_follow_show (
 user_id INTEGER NOT NULL REFERENCES "user"(user_id),
 show_id INTEGER NOT NULL REFERENCES show(show_id),
 follow_timestamp TIMESTAMP NOT NULL
);

CREATE TABLE user_rate_show (
 user_id INTEGER NOT NULL REFERENCES "user"(user_id),
 show_id INTEGER NOT NULL REFERENCES show(show_id),
 rating INTEGER NOT NULL,
 rating_timestamp TIMESTAMP NOT NULL
);

CREATE TABLE user_watch_episode (
 user_id INTEGER NOT NULL REFERENCES "user"(user_id),
 episode_id INTEGER NOT NULL REFERENCES episode(episode_id),
 watch_timestamp TIMESTAMP NOT NULL
);

INSERT INTO show VALUES (1,'Le Jeu des thrones','TUER TUER TUER',4242,'sf|gore','ABC');
INSERT INTO show VALUES (2,'Scnadal','C est un SCANDAL',4242,'ji|c|pas','ABC');

INSERT INTO episode VALUES (1,1,1,1,1528196872);
INSERT INTO episode VALUES (2,1,1,2,1528196872);
INSERT INTO episode VALUES (3,2,1,1,1528196872);
INSERT INTO episode VALUES (4,2,1,2,1528196872);

INSERT INTO "user" VALUES (1,1528196872,'bnj','LH','t@t.t','1234');
INSERT INTO "user" VALUES (1,1528196872,'robin','PIPICHON','y@y.y','1234');

INSERT INTO user_follow_show VALUES (1,1,1528196872);
INSERT INTO user_follow_show VALUES (2,2,1528196872);

INSERT INTO user_rate_show VALUES (1,1,20,1528196872);
INSERT INTO user_rate_show VALUES (1,2,15,1528196872);

INSERT INTO user_watch_episode VALUES (1,1,1528196872);
INSERT INTO user_watch_episode VALUES (1,2,1528196872);
