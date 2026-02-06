#!/usr/bin/env bash
set -e

bundle config set deployment true
bundle config set without 'development test'
bundle install

bundle exec rails db:migrate
bundle exec rails db:seed

echo "✅ Build + seeds complete!"
