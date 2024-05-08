#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
# bundle exec rails db:reset
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rake db:reset db:seed
bundle exec rails db:migrate
# bundle exec rails db:seed

