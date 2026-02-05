#!/bin/bash
APP_URL="https://network-swap-app-final.onrender.com"
LOG_FILE="network_swap_test_$(date +%Y%m%d_%H%M%S).txt"

echo "🚀 Testing Thomas IT Production ($APP_URL)..." | tee "$LOG_FILE"
test_endpoint() {
  local endpoint=$1; local desc=$2
  echo "Testing: $desc" | tee -a "$LOG_FILE"
  local code=$(curl -s -w "%{http_code}" -o /dev/null "$APP_URL$endpoint")
  echo "  Status: $code" | tee -a "$LOG_FILE"
  [ "$code" = "200" ] && echo "  ✅ PASS" || echo "  ❌ FAIL"
  echo "" | tee -a "$LOG_FILE"
}

test_endpoint "/" "Landing page"
test_endpoint "/css/thomas-it.css" "CSS Stylesheet"        # ← NEW!
test_endpoint "/up" "Healthcheck"
test_endpoint "/dashboard" "Dashboard"
test_endpoint "/api/devices" "API Devices"
test_endpoint "/api/shipments" "API Shipments"

echo "🎉 ALL TESTS COMPLETE - check $LOG_FILE" | tee -a "$LOG_FILE"
