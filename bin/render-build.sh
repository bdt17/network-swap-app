#!/usr/bin/env bash
set -o errexit

# Install dependencies
bundle install

# Precompile assets
bundle exec rails assets:precompile

# Clean old assets
bundle exec rails assets:clean

# Run migrations (Render provides DATABASE_URL)
bundle exec rails db:migrate

# Optional: Seed if needed
# bundle exec rails db:seed
