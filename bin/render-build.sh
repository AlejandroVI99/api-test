#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
build:
  - name: llenar
    env: production
    cmd: |
      rails runner db/scripts/insert_restaurants.rb