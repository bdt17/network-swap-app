#!/usr/bin/env bash
set -o errexit
set -o pipefail

# Install gems
bundle lock --add-platform x86_64-linux
bundle install -j4

# Precompile assets
bundle exec rails assets:precompile

# Clean old assets
bundle exec rails assets:clobber

# Create/parse database + migrate (Render provides DATABASE_URL)
bundle exec rails db:prepare

# Verify app boots
bundle exec rails runner "Rails.application.load_tasks; puts 'Build successful'"
