#!/bin/bash

sudo -u postgres psql -f ./sql/create_admin_user.sql
[ -e ~/.pgpass ] && rm ~/.pgpass
touch ~/.pgpass
chmod 600 ~/.pgpass
echo "*:*:*:admin:admin42" >> ~/.pgpass
psql --username=admin

