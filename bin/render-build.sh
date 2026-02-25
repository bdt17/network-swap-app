#!/usr/bin/env bash
set -o errexit
set -o pipefail

# Install gems
bundle lock --add-platform x86_64-linux
bundle install -j4

# Precompile assets  
bundle exec rails assets:precompile
bundle exec rails assets:clobber

# NUCLEAR DATABASE RESET - Creates ALL tables (fleets, etc.)
bundle exec rails db:drop db:create db:migrate
