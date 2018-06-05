#!/bin/bash

sudo -u postgres psql -f ./sql/set_configuration.sql
sudo service postgresql restart