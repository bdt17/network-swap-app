#!/usr/bin/env bash
set -e

bundle lock --add-platform x86_64-linux
bundle install --without development test
bundle exec rails db:migrate
rails assets:clobber
echo "✅ Build complete"
