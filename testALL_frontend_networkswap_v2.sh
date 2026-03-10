#!/bin/bash
echo "🖥️  PHARMA TRANSPORT - FRONTEND TEST SUITE v2.0 (FIXED)"
echo "================================================================================="

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
PASSED=0; TOTAL=0; FAILED=()

test_page() {
  ((TOTAL++))
  echo -n "Testing $1... "
  http_code=$(curl -s -o /dev/null -w "%{http_code}" "$2")
  size=$(curl -s "$2" | wc -c)
  time=$(curl -s -w "%{time_total}" -o /dev/null "$2")
  
  if [[ $http_code == "200" ]]; then
    echo -e "${GREEN}✓ $http_code${NC} (${size}b, ${time}s)"
    ((PASSED++))
  else
    echo -e "${RED}✗ $http_code${NC}"
    FAILED+=("$1")
  fi
}

# TESTS
test_page "Home" "http://localhost:3000"
test_page "Tech Dashboard" "http://localhost:3000/dashboard/tech"
test_page "Dashboard" "http://localhost:3000/dashboard" 
test_page "AR Glasses" "http://localhost:3000/dashboard/ar"

echo ""
echo "✅ FRONTEND: ${PASSED}/${TOTAL} ($(echo "scale=1; $PASSED*100/$TOTAL" | bc)%)"
