#!/bin/bash
BASE="https://network-swap-app.onrender.com"
echo "🖥️ /tech size: $(curl -s "$BASE/tech" | wc -c) bytes"
echo "🚁 Fleet JSON: $(curl -s "$BASE/api/drones/fleet" | jq .[0].id)"
echo "🔍 Inspect: $(curl -s "$BASE/api/drones/1/inspect" | jq .id)"
echo "🎮 Control: $(curl -s "$BASE/api/drones/1/control" | jq .id)"
