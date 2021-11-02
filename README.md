# BoozeThereAPI
API connection to booze there db to interface with app

To run locally:

Make sure you have ruby + bundler installed, as well as mysql configured and running

# FOR MySQL

If on a mac, easiest run is to run through brew

To check if you have the mysql service downlaoded and running, run `brew services list`

You also must make sure you mysql instance has this user configured with all access:
UN: boozethere
PW: root

and the database booze_there_local



# TO START

`export adapter=mysql2` 

`run bundle update`

`run bundle exec rackup` for the app to start


