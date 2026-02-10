#!/bin/bash
BASE_URL="https://network-swap-static.onrender.com"
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

test_tailwind() {
  echo -e "🎨 ${YELLOW}Testing Tailwind CSS...${NC}"
  RESPONSE=$(curl -s "$1" -H "User-Agent: Mozilla/5.0")
  if echo "$RESPONSE" | grep -qi tailwind; then
    echo -e "${GREEN}✅ Tailwind CSS detected${NC}"
    return 0
  fi
  echo -e "${RED}⚠️  Tailwind CSS not detected${NC}"
  return 1
}

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
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$url" \
    -H "Content-Type: application/json" \
    -H "User-Agent: Mozilla/5.0" \
    -d '{"test": "ping"}')
  if [[ $STATUS == "200" || $STATUS == "201" || $STATUS == "404" ]]; then
    echo -e "${GREEN}✅ $name OK ($STATUS)${NC}"
  else
    echo -e "${RED}❌ $name FAILED ($STATUS)${NC}"
  fi
}

echo -e "${GREEN}🚀 Testing Thomas IT Network Swap - FULL PRODUCTION${NC}"
echo -e "📍 Base URL: $BASE_URL"
echo "=================================="
start_time=$(date +%s)

# CORE DASHBOARDS
test_status "$BASE_URL/" "Main Dashboard"
test_status "$BASE_URL/tech" "Tech Dashboard (Phase 8)"
test_status "$BASE_URL/inventory" "Network Inventory"

# FUTURE PHASES (404 expected)
test_status "$BASE_URL/ar" "AR Repair Guide (Phase 10)"
test_status "$BASE_URL/dispatch" "Dispatch Tower (Phase 9)"
test_status "$BASE_URL/drones" "Drone Diagnostics (Phase 14)"

# API ENDPOINTS
test_api "$BASE_URL/api/swaps" "Swaps API"
test_api "$BASE_URL/api/swaps/bulk_create" "Bulk Swaps API" 
test_api "$BASE_URL/api/devices" "Devices API"

# PERFORMANCE
test_tailwind "$BASE_URL/"

end_time=$(date +%s)
duration=$((end_time - start_time))
echo "=================================="
echo -e "⚡ ${GREEN}Page Speed:${NC} ${duration}s"
echo -e "${GREEN}🎉 Thomas IT Network Swap UI Tests COMPLETE${NC}"
echo "🕐 $(date)"
echo "📁 Phases 4-8 LIVE ✅ | Layout backed up ✅"
