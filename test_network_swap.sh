#!/bin/bash
LOCAL_URL="http://localhost:3000"
PROD_URLS=(
  "https://network-swap-app.onrender.com"
)
LOG_FILE="network_swap_test_$(date +%Y%m%d_%H%M%S).txt"

echo "🚀 Testing Thomas IT: LOCAL vs PRODUCTION" | tee "$LOG_FILE"

test_endpoint() {
  local base_url=$1
  local endpoint=$2 
  local desc=$3
  echo "  $desc: $endpoint" | tee -a "$LOG_FILE"
  local code=$(curl -s -w "%{http_code}" -o /dev/null -m 10 "$base_url$endpoint" || echo "TIMEOUT")
  echo "    Status: $code" | tee -a "$LOG_FILE"
  [ "$code" = "200" ] && echo "    ✅ PASS" || echo "    ❌ FAIL ($code)"
}

ENDPOINTS=(
  "/" "Landing page"
  "/session/new" "LOGIN PAGE"
  "/api/devices" "API Devices" 
  "/dashboard" "Dashboard"
)

for url in "$LOCAL_URL" "${PROD_URLS[@]}"; do
  echo "=== $url ===" | tee -a "$LOG_FILE"
  for i in {0..7..2}; do
    endpoint="${ENDPOINTS[$i]}"
    desc="${ENDPOINTS[$((i+1))]}"
    test_endpoint "$url" "$endpoint" "$desc"
  done
  echo ""
done

echo "🎉 TESTS COMPLETE - $LOG_FILE" | tee -a "$LOG_FILE"
