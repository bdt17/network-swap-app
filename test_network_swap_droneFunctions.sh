#!/bin/bash
# THOMAS IT NETWORK SWAP - DRONE FUNCTIONS TEST SUITE v3.0
set -euo pipefail  # Strict mode

BASE_URL="https://network-swap-app.onrender.com"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG="drone_test_${TIMESTAMP}.txt"

> "$LOG"  # Clear log
exec > >(tee -a "$LOG") 2>&1  # Log all output

echo "🦾 THOMAS IT NETWORK SWAP - DRONE FUNCTIONS TEST SUITE v3.0"
echo "======================================================================"
echo "🕐 Testing at $(date)"
echo "📍 $BASE_URL"

# Colors
RED='\033[0;31m' GREEN='\033[0;32m' YELLOW='\033[1;33m' BLUE='\033[0;34m' NC='\033[0m'

test_api() {
    local num=$1 desc=$2 endpoint=$3
    printf "\n${BLUE}%s. %s...${NC}" "$num" "$desc"
    
    response=$(curl -s -w "\nHTTP:%{http_code}" -m 10 "$endpoint" \
        -H "Accept: application/json" || echo "\nHTTP:408")
    
    code=$(echo "$response" | tail -1 | cut -d: -f2)
    body=$(echo "$response" | sed '$d')
    
    case $code in
        200) echo -e "${GREEN}✅ OK${NC}"; echo "$body" | jq . 2>/dev/null || echo "$body" | cut -c1-120 ;;
        404) echo -e "${RED}❌ 404${NC}"; echo "   👉 Missing: $endpoint" ;;
        500) echo -e "${RED}❌ 500${NC}"; echo "   👉 Check Render logs" ;;
        *)   echo -e "${YELLOW}⚠️ $code${NC}" ;;
    esac
}

# PHASE-BY-PHASE TESTS (Matches your architecture)
test_api 1 "DJI Fleet Status (Phase 14)" "$BASE_URL/api/devices"
test_api 2 "Drone Inspection (Phase 14)" "$BASE_URL/api/drones/DJI-001/inspect"
test_api 3 "Swarm Status (Phase 14)" "$BASE_URL/api/drones/swarm/status"
test_api 4 "Firmware Status (Phase 13)" "$BASE_URL/api/firmware/DJI-001/status"
test_api 5 "EOL Claim (Phase 6)" "$BASE_URL/api/swaps/2001/claim"
test_api 6 "AI Dispatch (Phase 7)" "$BASE_URL/api/ai/dispatch"
test_api 7 "Site Telemetry" "$BASE_URL/api/sites/phoenix-dc21/telemetry"
test_api 8 "Diagnostics (Phase 14)" "$BASE_URL/api/drones/DJI-001/diagnostics"

# Business Critical
echo -e "\n${YELLOW}9. Twilio SMS...${NC}"
curl -s -w "HTTP: %{http_code}\n" -X POST \
    -H "Content-Type: application/json" \
    -d '{"tech":"Smith,J","device":"C9300"}' \
    "$BASE_URL/api/notifications/sms" | tee -a "$LOG"

echo -e "\n${BLUE}10. Health Check...${NC}"
curl -s -w "HTTP: %{http_code}\n" "$BASE_URL/health" | tee -a "$LOG"

# SUMMARY
echo "
🎯 DRONE FUNCTIONS SUMMARY
✅ DJI Count: $(curl -s "$BASE_URL/api/devices" 2>/dev/null | grep -c DJI || echo 0)
✅ Phoenix DC21: $(curl -s "$BASE_URL/api/sites" 2>/dev/null | grep -c Phoenix || echo OFFLINE)
✅ Phase 14 APIs: $(curl -s "$BASE_URL/api/health" 2>/dev/null | grep -c Phase || echo PENDING)
📊 Log: $LOG
"

cat << 'EOF'

🚀 QUICK FIX COMMANDS:

1. Routes (config/routes.rb):
```ruby
namespace :api do
  get 'drones/:id/inspect', to: 'drones#inspect'
  get 'drones/swarm/status', to: 'drones#swarm'
  get 'firmware/:id/status', to: 'firmware#status'
end
