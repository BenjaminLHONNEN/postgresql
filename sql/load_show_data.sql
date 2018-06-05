\c shows

ALTER TABLE "show" DISABLE TRIGGER ALL;
ALTER TABLE "episode" DISABLE TRIGGER ALL;
ALTER TABLE "user" DISABLE TRIGGER ALL;
ALTER TABLE "user_follow_show" DISABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" DISABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" DISABLE TRIGGER ALL;

COPY show  FROM '/mnt/c/postgre/show.csv' DELIMITER ',' CSV HEADER;
COPY episode FROM '/mnt/c/postgre/episode.csv' DELIMITER ',' CSV HEADER;
COPY "user" FROM '/mnt/c/postgre/user.csv' DELIMITER ',' CSV HEADER;
COPY user_follow_show FROM '/mnt/c/postgre/user_follow_show.csv' DELIMITER ',' CSV HEADER;
COPY user_rate_show FROM '/mnt/c/postgre/user_rate_show.csv' DELIMITER ',' CSV HEADER;
COPY user_watch_episode FROM '/mnt/c/postgre/user_watch_episode.csv' DELIMITER ',' CSV HEADER;

ALTER TABLE "show" ENABLE TRIGGER ALL;
ALTER TABLE "episode" ENABLE TRIGGER ALL;
ALTER TABLE "user" ENABLE TRIGGER ALL;
ALTER TABLE "user_follow_show" ENABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" ENABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" ENABLE TRIGGER ALL;
