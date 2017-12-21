#!/bin/bash

bundle install --without development test
rake db:migrate

#RACK_ENV=production ruby app.rb -p 3000

