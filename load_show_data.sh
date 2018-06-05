#!/bin/bash
sudo psql --username=admin -f ./sql/create_show_database.sql
sudo psql --username=admin -f ./sql/load_show_data.sql
