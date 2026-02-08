#!/usr/bin/env bash
set -e
bundle config set without 'development test' --local
bundle install
echo "✅ Phase 7 LIVE: Rails $(bundle exec rails -v)"
