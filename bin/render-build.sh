#!/usr/bin/env bash
set -e
bundle install
bundle exec rails db:migrate
echo "=== Static HTML deploy ready ==="
