#!/usr/bin/env bash
set -e

# Clear any frozen configs first
bundle config unset frozen --local || true
bundle config unset deployment --local || true

# Production install
bundle config set deployment true
bundle config set without 'development test'
bundle install

# Database
bundle exec rails db:migrate
bundle exec rails db:seed

echo "✅ Build + 1000 devices seeded!"
