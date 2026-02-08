#!/bin/bash
BASE_URL="https://network-swap-app.onrender.com"

test_tailwind() {
  echo "🎨 Testing Tailwind CSS..."
  if curl -s -H "User-Agent: Mozilla/5.0" "$1" | grep -qi tailwind; then
    echo "✅ Tailwind CSS detected"
    return 0
  fi
  echo "⚠️  Tailwind CSS not detected"
  return 1
}

echo "🎨 Testing Thomas IT Network Swap UI ($BASE_URL)"
start_time=$(date +%s.%N)

# Dashboard (/)
echo "🎯 Testing UI: Dashboard"
curl -s -w "Status: %{http_code} | Size: %{content_length}B\n" \
  -H "User-Agent: Mozilla/5.0" \
  "$BASE_URL/" | tee /tmp/dashboard.html > /dev/null
test_tailwind "$BASE_URL/"

# Inventory
echo "🎯 Testing UI: Inventory"
curl -s -w "Status: %{http_code} | Size: %{content_length}B\n" \
  -H "User-Agent: Mozilla/5.0" \
  "$BASE_URL/inventory" | tee /tmp/inventory.html > /dev/null

# API endpoints
echo "🎯 Testing API: Devices"
curl -s -w "Status: %{http_code} | Size: %{content_length}B\n" \
  "$BASE_URL/api/devices"

echo "⚡ Page Speed: $(echo "$(date +%s.%N) - $start_time" | bc -l | cut -d. -f1)s"
echo "🎉 UI Tests COMPLETE - $(date)"
