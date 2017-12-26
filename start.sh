#!/bin/bash

bundle install --without development test
rake db:migrate

/sbin/my_init

#RACK_ENV=production ruby app.rb -p 3000

