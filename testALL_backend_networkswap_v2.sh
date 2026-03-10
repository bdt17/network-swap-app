#!/bin/bash
echo "⚙️  BACKEND API TEST SUITE v2.0 (FIXED)"
echo "================================================================================="

RED='\033[0;31m'; GREEN='\033[0;32m'; PASSED=0; TOTAL=0; FAILED=()

test_api() {
  ((TOTAL++))
  echo -n "Testing $1... "
  code=$(curl -s -o /dev/null -w "%{http_code}" "$2")
  if [[ $code == $3 ]]; then
    echo -e "${GREEN}✓ $code${NC}"
    ((PASSED++))
  else
    echo -e "${RED}✗ $code${NC}"
    FAILED+=("$1")
  fi
}

# API TESTS
test_api "Devices JSON" "http://localhost:3000/api/devices" "200"
test_api "CSV Export" "http://localhost:3000/api/devices/export.csv" "200" 
test_api "Drones API" "http://localhost:3000/api/drones" "404"
test_api "SMS Dispatch" "http://localhost:3000/api/dispatch_sms" "200"

# DB (clean output)
devices=$(rails runner "puts Device.count" 2>/dev/null | tail -1)
drones=$(rails runner "puts Drone.count" 2>/dev/null | tail -1)
echo "💾 DB: ${devices} devices, ${drones} drones"

echo "✅ BACKEND: ${PASSED}/${TOTAL} ($(echo "scale=1; $PASSED*100/$TOTAL" | bc)%)"
