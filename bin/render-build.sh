#!/usr/bin/env bash
set -e
bundle config set without 'development test' --local
bundle install
bundle exec rails css:build
bundle exec rails db:migrate
echo "✅ Phase 7 LIVE: Rails $(bundle exec rails -v)"
