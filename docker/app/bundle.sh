#!/bin/bash
set -e
cd /home/app/voting-app
bundle check || bundle install --without development test --deployment
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rake assets:precompile
