#!/usr/bin/env bash
set -e
bundle check || bundle install --without development test
bundle exec rails assets:precompile
bundle exec rails db:migrate
echo "✅ Phase 7 LIVE: $(bundle exec rails -v)"
