#!/usr/bin/env bash
set -e

echo "=== Bundle install ==="
bundle install

echo "=== Skip migrations for static HTML deploy ==="
echo "=== Deploy ready ==="
