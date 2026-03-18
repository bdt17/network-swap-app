#!/bin/bash
echo "=== Finalizing Rackup Migration ==="

# Update Render start command compatible
cat > Procfile.rackup << EOF
web: bundle exec rackup config.ru -p \$PORT -o 0.0.0.0
