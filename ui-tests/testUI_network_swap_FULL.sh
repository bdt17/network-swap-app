#!/bin/bash
BASE_URL="https://network-swap-app.onrender.com"

test_tailwind() {
  echo "🎨 Testing Tailwind CSS..."
  RESPONSE=$(curl -s "$1")
  if echo "$RESPONSE" | grep -qi tailwind; then
    echo "✅ Tailwind CSS detected"
    return 0
  fi
  echo "⚠️  Tailwind CSS not detected"
  return 1
}

echo "🎨 Testing Thomas IT Network Swap UI ($BASE_URL)"
start_time=$(date +%s)

echo "🎯 Testing UI: Dashboard"
DASH=$(curl -s -w "HTTP%{http_code} %{size_download} bytes" -H "User-Agent: Mozilla/5.0" "$BASE_URL/")
echo "$DASH"
test_tailwind "$BASE_URL/"

echo "🎯 Testing UI: Inventory"  
INV=$(curl -s -w "HTTP%{http_code} %{size_download} bytes" -H "User-Agent: Mozilla/5.0" "$BASE_URL/inventory")
echo "$INV"

echo "🎯 Testing API: Devices"
DEV=$(curl -s -w "HTTP%{http_code} %{size_download} bytes" "$BASE_URL/api/devices")
echo "$DEV"

echo "⚡ Page Speed: $(( $(date +%s) - $start_time ))s"
echo "🎉 UI Tests COMPLETE - $(date)"
