#!/bin/bash
BASE_URL="http://localhost:3000"
echo "🚀 NETWORKSWAP FULL FEATURE TEST"
echo "================================="

test_page() {
  local path=$1 name=$2
  local size=$(curl -s -w "%{size_download}" -o /tmp/$name.html "$BASE_URL$path" 2>/dev/null)
  status=$?
  if [ $status -eq 0 ] && [ $size -gt 500 ]; then
    echo "✅ $name ($size B)"
  else
    echo "❌ $name"
  fi
}

echo "CORE DASHBOARD:"
test_page "/" "home"
test_page "/dashboard" "dashboard"
test_page "/tech" "tech"

echo -e "\nNETWORKSWAP FEATURES:"
test_page "/networks" "networks"
test_page "/devices" "devices" 
test_page "/swaps" "swaps"
test_page "/api/devices" "api_devices"

echo -e "\nCONTENT:"
curl -s "$BASE_URL/dashboard" | grep -i "network\|device\|swap" | head -5
