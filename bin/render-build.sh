#!/usr/bin/env bash
set -e

echo "=== Bundle install ==="
bundle install

echo "=== Database migrate ==="
bundle exec rails db:migrate

echo "=== Deploy ready ==="
