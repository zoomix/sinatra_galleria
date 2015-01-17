#!/bin/sh
cd sinatra_galleria
rake thumb_gen &
bundle exec rackup
