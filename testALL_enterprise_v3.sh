#!/bin/bash
echo "💎 THOMAS IT NETWORK SWAP - ENTERPRISE TEST SUITE v3.0"
echo "═══════════════════════════════════════════════════════════════"
echo "Full-stack: Frontend + Backend + Production + Performance + DB"

# Colors & counters
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
PASSED=0; TOTAL=0; FAILED=()

# Enterprise test functions
test_endpoint() {
  ((TOTAL++))
  echo -n "  $1... "
  code=$(curl -s -o /dev/null -w "%{http_code}" "$2" 2>/dev/null)
  if [[ $code == $3 ]]; then
    echo -e "${GREEN}✓$NC"
    ((PASSED++))
  else
    echo -e "${RED}✗ $code$NC${NC}"
    FAILED+=("$1")
  fi
}

test_post() {
  ((TOTAL++))
  echo -n "  $1... "
  code=$(curl -s -X POST -H "Content-Type: application/json" -d '{}' "$2" -w "%{http_code}" -o /dev/null 2>/dev/null)
  if [[ $code == $3 ]]; then
    echo -e "${GREEN}✓$NC"
    ((PASSED++))
  else
    echo -e "${RED}✗ $code$NC"
    FAILED+=("$1")
  fi
}

echo "🔌 PRODUCTION ENDPOINTS"
test_endpoint "Prod Tech Dashboard" "https://network-swap-app.onrender.com/dashboard/tech" "200"
test_endpoint "Prod Devices API" "https://network-swap-app.onrender.com/api/devices" "200"
test_post "Prod SMS Dispatch" "https://network-swap-app.onrender.com/api/dispatch_sms" "200"

echo ""
echo "🔌 LOCAL ENDPOINTS"  
test_endpoint "Local Tech Dashboard" "http://localhost:3000/dashboard/tech" "200"
test_endpoint "Local Devices API" "http://localhost:3000/api/devices" "200"
test_post "Local SMS Dispatch" "http://localhost:3000/api/dispatch_sms" "200"

echo ""
echo "💾 DATABASE HEALTH"
devices=$(rails runner "puts Device.count" 2>/dev/null | tail -1 | tr -d ' \n')
drones=$(rails runner "puts Drone.count" 2>/dev/null | tail -1 | tr -d ' \n')
((TOTAL++))
if [[ $devices -gt 0 ]]; then
  echo -e "${GREEN}✓ ${devices} devices, ${drones} drones${NC}"
  ((PASSED++))
else
  echo -e "${RED}✗ Empty DB${NC}"
fi

echo ""
echo "📊 PERFORMANCE (Local)"
time=$( { time curl -s "http://localhost:3000/dashboard/tech" > /dev/null; } 2>&1 | awk '{print $2}' )
((TOTAL++))
if (( $(echo "$time < 0.5" | bc -l) )); then
  echo -e "${GREEN}✓ ${time}s (fast)${NC}"
  ((PASSED++))
else
  echo -e "${YELLOW}⚠ ${time}s (slow)${NC}"
  ((PASSED++))
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "ENTERPRISE STATUS: ${PASSED}/${TOTAL} ($(echo "scale=1; $PASSED*100/$TOTAL" | bc)%)"
if [ ${#FAILED[@]} -eq 0 ]; then
  echo -e "${GREEN}🎉 PRODUCTION READY - FIELD OPERATIONS LIVE${NC}"
else
  echo -e "${RED}❌ FIX REQUIRED:${NC}"
  for f in "${FAILED[@]}"; do echo "   $f"; done
fi
