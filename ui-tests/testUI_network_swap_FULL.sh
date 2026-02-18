#!/bin/bash
BASE_URL="https://network-swap-app.onrender.com"
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

test_status() {
  local url=$1
  local name=$2
  echo -e "🎯 Testing UI: ${YELLOW}$name${NC}"
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$url" -H "User-Agent: Mozilla/5.0")
  SIZE=$(curl -s -w "%{size_download} bytes" "$url" -H "User-Agent: Mozilla/5.0" | tail -1)
  if [[ $STATUS == "200" ]]; then
    echo -e "${GREEN}✅ $name OK ($STATUS)${NC} $SIZE"
  else
    echo -e "${RED}❌ $name FAILED ($STATUS)${NC} $SIZE"
  fi
}

test_api() {
  local url=$1
  local name=$2
  echo -e "🔌 Testing API: ${YELLOW}$name${NC}"
  RESPONSE=$(curl -s -w "HTTP%{http_code} - %{size_download} bytes\n" "$url" -H "Accept: application/json")
  if echo "$RESPONSE" | grep -q "HTTP2.. - "; then
    echo -e "${GREEN}✅ $name OK${NC}"
  else
    echo -e "${RED}❌ $name FAILED${NC}"
  fi
  echo "$RESPONSE"
}

echo -e "${GREEN}🚀 Testing Thomas IT Network Swap PHASE 13 - SINGLE APP${NC}"
echo -e "📍 SINGLE APP: $BASE_URL"
echo "=================================="

# STATIC ROUTES (should 200 OR 404 expected)
test_status "$BASE_URL/" "Main Dashboard"
test_status "$BASE_URL/tech" "Tech Dashboard"
test_status "$BASE_URL/dispatch" "Dispatch Tower" 
test_status "$BASE_URL/inventory" "Network Inventory"
test_status "$BASE_URL/eol_swaps" "EOL Swaps"
test_status "$BASE_URL/enterprise" "Enterprise"

# PHASE 13 CRITICAL API TESTS
echo -e "\n${GREEN}🔥 PHASE 13 API TESTS${NC}"
test_api "$BASE_URL/api/swaps" "Swaps Index (Smith,J. #2001)"
test_api "$BASE_URL/api/swaps/2001" "Swap #2001 (CLAIM TEST)"

echo -e "\n🎉 ${GREEN}THOMAS IT PHASE 13 PRODUCTION TEST COMPLETE${NC}"
echo "🚀 Phoenix DC21 → Field Ready"
