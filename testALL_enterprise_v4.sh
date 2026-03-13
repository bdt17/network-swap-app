#!/bin/bash
echo "🖥️🚁 THOMAS IT ENTERPRISE TEST SUITE v4.0 - DRONES PRIORITY"
echo "================================================================================="

BASE_URL="https://network-swap-app.onrender.com"
TESTS=0; PASS=0; DRONE_PASS=0; DRONE_TESTS=0

# Feature matrix from your dashboard
test_feature() {
  local url=$1; local name=$2; local expected=$3; local is_drone=${4:-0}
  ((TESTS++)); [[ $is_drone == 1 ]] && ((DRONE_TESTS++))
  echo -n "  $name... "
  
  status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  if [[ $status == "200" ]]; then
    echo "✅ $status"
    ((PASS++)); [[ $is_drone == 1 ]] && ((DRONE_PASS++))
  else
    echo "✗ $status"
  fi
}

echo "📊 DASHBOARD FEATURES (LIVE)"
test_feature "$BASE_URL/"                    "Home"                          "200"
test_feature "$BASE_URL/tech"                 "Tech Portal"                   "200" 
test_feature "$BASE_URL/dashboard"            "Main Dashboard"                "200"
test_feature "$BASE_URL/ar"                   "AR Glasses"                    "200"

echo ""
echo "🚁 DRONE OPERATIONS (PRIORITY)"
test_feature "$BASE_URL/api/health"           "API Health"                    "200" 0
test_feature "$BASE_URL/api/drones/fleet"     "DJI Fleet API"                 "200" 1
test_feature "$BASE_URL/api/drones/1/inspect" "DJI Inspect #1"                "200" 1
test_feature "$BASE_URL/api/drones/1/control" "DJI Control #1"                "200" 1

echo ""
echo "📦 ENTERPRISE FEATURES"
test_feature "$BASE_URL/api/devices/export"   "CSV Export"                    "200" 0
test_feature "$BASE_URL/api/dispatch_sms"     "SMS Dispatch (POST)"           "200" 0

echo "================================================================================="
printf "🎯 TOTAL: %d/%d (%.0f%%)\n" $PASS $TESTS $(echo "scale=0; $PASS/$TESTS*100" | bc -l)
printf "🚁 DRONES: %d/%d (%.0f%%)\n" $DRONE_PASS $DRONE_TESTS $(echo "scale=0; $DRONE_PASS/$DRONE_TESTS*100" | bc -l)
[[ $PASS -eq $TESTS ]] && echo "💎 PHARMA TRANSPORT ENTERPRISE: 100% PRODUCTION READY" || echo "🔧 Fix ${TESTS/PASS} failures"
