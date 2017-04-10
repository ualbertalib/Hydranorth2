#!/bin/bash
# this is shell script to start HydraNorth2 running in docker container
# Maintainer: strilets@ualberta.ca

#make sure that database has been created
while [ ! -e /db/${HYDRANORTH_DB:-hydranorth2dev} ]
do
    sleep 2
done

cd /app

#check if db has been migrated
if [ ! -e /db/initialized ]; then
    sleep 10 && rake db:migrate && touch /db/initialized;
fi

rails server -b 0.0.0.0
