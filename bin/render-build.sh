#!/usr/bin/env bash
set -o errexit
set -o pipefail

# Install gems
bundle lock --add-platform x86_64-linux
bundle install -j4

# Precompile assets
bundle exec rails assets:precompile
bundle exec rails assets:clobber

# CRITICAL: Use separate steps to avoid schema loading
bundle exec rails db:create db:migrate
