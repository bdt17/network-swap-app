#!/bin/bash
APP_URL="https://network-swap-app.onrender.com"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG="../logs/ui_test_network_swap_${TIMESTAMP}.txt"

echo "🎨 Testing Thomas IT Network Swap UI ($APP_URL)" | tee "$LOG"

test_page_speed() {
  echo -e "\n⚡ Page Speed Test: $1" | tee -a "$LOG"
  curl -s -o /dev/null -w "  Time: %{time_total}s\n" "$1" | tee -a "$LOG"
}

test_html_content() {
  echo -e "\n🎯 Testing: $1" | tee -a "$LOG"
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$2")
  SIZE=$(curl -s -w "%{size_download}" -o /dev/null "$2")
  HTML=$(curl -s "$2" | grep -c "<html\|<!DOCTYPE\|<body")
  
  echo "  Status: $STATUS | Size: ${SIZE}B | HTML tags: $HTML" | tee -a "$LOG"
  
  if [ "$STATUS" = "200" ]; then
    echo "  ✅ LIVE" | tee -a "$LOG"
  else
    echo "  ❌ DOWN" | tee -a "$LOG"
  fi
}

# TESTS
test_page_speed "$APP_URL/"
test_html_content "Dashboard" "$APP_URL/"
test_html_content "Inventory" "$APP_URL/inventory"
test_page_speed "$APP_URL/health"

echo -e "\n🎉 Thomas IT Network Swap Status:\n$(curl -s "$APP_URL/")\n" | tee -a "$LOG"
