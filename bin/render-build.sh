#!/usr/bin/env bash
set -o errexit
set -o pipefail

bundle lock --add-platform x86_64-linux
bundle install -j4
bundle exec rails assets:precompile
bundle exec rails assets:clobber

# NUCLEAR OPTION: Recreate database completely
bundle exec rails db:drop db:create db:migrate
