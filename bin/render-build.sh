#!/usr/bin/env bash
set -e
bundle lock
bundle install --deployment --without development test
echo "Rack static HTML ready"
