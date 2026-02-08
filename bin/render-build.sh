#!/usr/bin/env bash
set -e
bundle lock --add-platform x86_64-linux 
bundle config set without 'development test'
bundle install
bundle exec rails db:migrate
bundle exec rails db:seed
echo "✅ Thomas IT Network Swap - FULL API LIVE"
