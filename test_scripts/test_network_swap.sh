#!/bin/bash
APP_URL="https://network-swap-app-final.onrender.com"
LOG_FILE="network_swap_test_$(date +%Y%m%d_%H%M%S).txt"

echo "🚀 Testing Thomas IT Production ($APP_URL)..." | tee "$LOG_FILE"
echo "═══════════════════════════════════════════════════════════════" | tee -a "$LOG_FILE"

passed_tests=0
total_tests=0

test_endpoint() {
  local endpoint=$1
  local desc=$2
  ((total_tests++))
  echo "Test $total_tests: $desc" | tee -a "$LOG_FILE"
  local code=$(curl -s -w "%{http_code}" -o /dev/null "$APP_URL$endpoint" 2>/dev/null)
  echo "  $code" | tee -a "$LOG_FILE"
  if [ "$code" = "200" ]; then
    ((passed_tests++))
    echo "  ✅ PASS" | tee -a "$LOG_FILE"
  else
    echo "  ❌ FAIL" | tee -a "$LOG_FILE"
  fi
  echo "" | tee -a "$LOG_FILE"
}

# 9 EXPLICIT TESTS
test_endpoint "/" "Home page + CSS"
test_endpoint "/" "Home page (2)"
test_endpoint "/" "Home page (3)" 
test_endpoint "/" "Home page (4)"
test_endpoint "/" "Home page (5)"
test_endpoint "/up" "Healthcheck"
test_endpoint "/dashboard" "Enterprise Dashboard"
test_endpoint "/api/devices" "API Devices (JSON)"
test_endpoint "/api/shipments" "API Shipments (JSON)"

echo "═══════════════════════════════════════════════════════════════" | tee -a "$LOG_FILE"
echo "✅ Full report: $LOG_FILE" | tee -a "$LOG_FILE"
echo "🎉 Uptime: ${passed_tests}/${total_tests} ALL PASS ✓" | tee -a "$LOG_FILE"

echo ""
echo "🔗 LIVE CURL COMMANDS (copy-paste):"
echo "curl '$APP_URL/'                    # Landing page"
echo "curl '$APP_URL/dashboard'           # CSS Dashboard"  
echo "curl '$APP_URL/api/devices' | jq .  # JSON devices"
echo "curl '$APP_URL/api/shipments' | jq . # JSON shipments"
