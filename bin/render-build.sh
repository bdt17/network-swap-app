#!/usr/bin/env bash
set -e

# Thomas IT Phase 14: FULL DB RESET + MIGRATE
bundle exec rails db:drop db:create db:migrate db:seed

# Precompile assets
bundle exec rails assets:precompile

echo "✅ Thomas IT Build: DB + Assets COMPLETE"
