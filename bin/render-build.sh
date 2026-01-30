#!/usr/bin/env bash
set -e

echo "🔨 Installing gems..."
bundle check || bundle install --without development test

echo "⚡ Precompiling assets..."
bundle exec rails assets:precompile
bundle exec rails assets:clean

echo "✅ Build complete - skipping db:prepare (production DB ready)"
