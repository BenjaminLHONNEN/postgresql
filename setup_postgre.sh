#!/bin/bash

echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" | sudo tee --append /etc/apt/sources.list.d/pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install postgresql-10 -y --allow-unauthenticated

psql -V
