#!/bin/bash
echo "⚙️ BACKEND v3.0 - FIXED POST REQUESTS"
RED='\033[0;31m'; GREEN='\033[0;32m'; PASSED=0; TOTAL=0

test_api() {
  ((TOTAL++)); echo -n "Testing $1... "
  if [[ $2 == "POST" ]]; then
    code=$(curl -s -X POST -H "Content-Type: application/json" -d '{}' "$3" -w "%{http_code}" -o /dev/null 2>/dev/null)
  else
    code=$(curl -s -o /dev/null -w "%{http_code}" "$3" 2>/dev/null)
  fi
  if [[ $code == $4 ]]; then echo -e "${GREEN}✓$NC"; ((PASSED++)); else echo -e "${RED}✗ $code$NC"; fi
}

test_api "Devices JSON" "GET" "http://localhost:3000/api/devices" "200"
test_api "CSV Export" "GET" "http://localhost:3000/api/devices/export.csv" "200"
test_api "Drones API" "GET" "http://localhost:3000/api/drones" "404"
test_api "SMS Dispatch" "POST" "http://localhost:3000/api/dispatch_sms" "200"  # ← FIXED POST

devices=$(rails runner "puts Device.count" 2>/dev/null | tail -1 | tr -d ' \n')
echo "💾 DB: ${devices} devices"
echo "✅ BACKEND: ${PASSED}/${TOTAL} ($(echo "scale=1; $PASSED*100/$TOTAL" | bc)% )"
