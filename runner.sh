#!/bin/sh
cd sinatra_galleria
rake thumb_gen med_gen &
bundle exec rackup
