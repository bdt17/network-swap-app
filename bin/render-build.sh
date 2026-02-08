#!/usr/bin/env bash
set -e

bundle lock --add-platform x86_64-linux
bundle config set without 'development test'
bundle install
echo "✅ Thomas IT Network Swap - SKIP migrations (no secret key needed)"
