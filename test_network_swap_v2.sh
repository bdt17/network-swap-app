#!/bin/bash
APP_URL="https://network-swap-app.onrender.com"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG="network_swap_test_${TIMESTAMP}.txt"

echo "🚀 Testing Thomas IT Network Swap App v2 ($APP_URL)" | tee "$LOG"

test_endpoint() {
  echo -e "\nTesting: $1" | tee -a "$LOG"
  STATUS=$(timeout 25 curl -s -o /dev/null -w "%{http_code}" "$2" || echo "TIMEOUT")
  echo "  Status: $STATUS" | tee -a "$LOG"
  if [ "$STATUS" = "200" ]; then
    echo "  ✅ PASS" | tee -a "$LOG"
  else
    echo "  ❌ FAIL ($STATUS)" | tee -a "$LOG"
  fi
}

test_endpoint "Healthcheck" "$APP_URL/health"
test_endpoint "Dashboard" "$APP_URL/"
test_endpoint "Inventory UI" "$APP_URL/inventory"
test_endpoint "API Devices" "$APP_URL/api/devices"
test_endpoint "Phase 7 AI" "$APP_URL/api/devices/1/ai_recommend"
test_endpoint "Audit Logs" "$APP_URL/api/audit_logs"

echo -e "\n🎉 Phase 7 COMPLETE - $(grep -c '✅ PASS' "$LOG") tests passed" | tee -a "$LOG"
echo "📄 Full log: $LOG"
