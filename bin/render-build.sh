#!/usr/bin/env bash
set -e
bundle lock --add-platform x86_64-linux
bundle install
bundle exec rake db:migrate
bundle exec rake assets:precompile
