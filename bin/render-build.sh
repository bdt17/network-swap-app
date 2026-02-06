#!/usr/bin/env bash
set -e

mkdir -p tmp/pids

bundle exec rails assets:clobber
bundle exec rails db:migrate
bundle exec rails db:seeds

# Skip assets:precompile (Rails 8.1 + Tailwind fix)
echo "✅ Assets skipped - Rails 8.1 native CSS handling"
