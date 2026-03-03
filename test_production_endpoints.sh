#!/bin/bash
echo "🚀 PRODUCTION ENDPOINT SMOKE TEST"
echo "═══════════════════════════════════"

BASE="https://network-swap-app.onrender.com"
TESTS=("/" "/status" "/api/devices" "/dashboard" "/api/dispatch_sms")

for endpoint in "${TESTS[@]}"; do
  echo -n "Testing $BASE$endpoint ... "
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE$endpoint")
  if [ "$STATUS" = "200" ]; then
    echo "🟢 PASS"
  else
    echo "🔴 FAIL ($STATUS)"
  fi
done

echo ""
echo "🧪 AI DISPATCH TEST:"
curl -s -X POST "$BASE/api/dispatch_sms" | jq .
