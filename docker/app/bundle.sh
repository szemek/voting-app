#!/bin/bash
set -e
cd /home/app/voting-app
bundle check || bundle install
bundle exec rake db:migrate
bundle exec rake assets:precompile
