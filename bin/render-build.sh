#!/usr/bin/env bash
set -o errexit
set -o pipefail

bundle lock --add-platform x86_64-linux
bundle install -j4
bundle exec rails assets:precompile
bundle exec rails assets:clobber

# Create database first, then migrate (avoids schema.rb loading)
bundle exec rails db:create
bundle exec rails db:migrate
