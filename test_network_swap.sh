#!/bin/bash
set -euo pipefail

LOCAL_URL="http://localhost:3000"
PROD_URLS=("https://network-swap-app.onrender.com")
LOG_FILE="network_swap_test_$(date +%Y%m%d_%H%M%S).txt"
ERROR_LOG="network_swap_errors_$(date +%Y%m%d_%H%M%S).txt"

# FIXED color codes
RED='\033[0;31m' GREEN='\033[0;32m' YELLOW='\033[1;33m' BLUE='\033[0;34m' NC='\033[0m'

log() { echo -e "${BLUE}== $1 ==${NC}" | tee -a "$LOG_FILE"; }

test_endpoint() {
  local base_url=$1 endpoint=$2 desc=$3
  echo "  $desc: $endpoint" | tee -a "$LOG_FILE"
  local code=$(curl -s -w "%{http_code}" -o /dev/null -m 10 "$base_url$endpoint" || echo "TIMEOUT")
  echo "    Status: $code" | tee -a "$LOG_FILE"
  [ "$code" = "200" ] && echo "    ✅ PASS" || echo "    ❌ FAIL ($code)" | tee -a "$ERROR_LOG"
}

echo "🚀 Testing PRODUCTION ONLY"
echo "Log: $LOG_FILE | Errors: $ERROR_LOG"

# Skip local if SKIP_LOCAL=true
if [ "${SKIP_LOCAL:-false}" != "true" ]; then
  echo -e "${BLUE}=== LOCAL: $LOCAL_URL ===${NC}"
  for url in "$LOCAL_URL"; do
    test_endpoint "$url" "/" "Landing"
    test_endpoint "$url" "/session/new" "Login"
    test_endpoint "$url" "/api/devices" "API Devices"
    test_endpoint "$url" "/dashboard" "Dashboard"
  done
fi

echo -e "${BLUE}=== PROD: ${PROD_URLS[0]} ===${NC}"
for url in "${PROD_URLS[@]}"; do
  test_endpoint "$url" "/" "Landing"
  test_endpoint "$url" "/session/new" "Login"  
  test_endpoint "$url" "/api/devices" "API Devices"
  test_endpoint "$url" "/dashboard" "Dashboard"
done

echo "🎉 COMPLETE - $LOG_FILE"
