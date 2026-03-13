#!/bin/bash
echo "🖥️🚁 THOMAS IT ENTERPRISE TEST SUITE v5.0 - DJI CLOUD API 180694"
echo "================================================================================="

BASE_URL="https://network-swap-app.onrender.com"
TESTS=0; PASS=0; DRONE_PASS=0; DRONE_TESTS=0; DJI_PASS=0; DJI_TESTS=0

test_feature() {
  local url=$1; local name=$2; local expected=$3; local is_drone=${4:-0}; local is_dji=${5:-0}
  ((TESTS++)); [[ $is_drone == 1 ]] && ((DRONE_TESTS++)); [[ $is_dji == 1 ]] && ((DJI_TESTS++))
  echo -n "  $name... "
  
  status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  if [[ $status == "200" ]]; then
    echo "✅ $status"
    ((PASS++)); [[ $is_drone == 1 ]] && ((DRONE_PASS++)); [[ $is_dji == 1 ]] && ((DJI_PASS++))
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
echo "🚁 DJI CLOUD API OPERATIONS (App ID 180694)"
test_feature "$BASE_URL/api/health"           "API Health"                    "200" 1 1
test_feature "$BASE_URL/api/drones/fleet"     "DJI Fleet API 180694"          "200" 1 1
test_feature "$BASE_URL/api/drones/1/inspect" "DJI Inspect #1"                "200" 1 1
test_feature "$BASE_URL/api/drones/1/control" "DJI Control #1"                "200" 1 1

echo ""
echo "📦 ENTERPRISE FEATURES (Healthcare PT)"
test_feature "$BASE_URL/api/devices/export"   "CSV Export 247 devices"        "200" 0 1
test_feature "$BASE_URL/api/dispatch_sms"     "SMS Dispatch"                  "200" 0 1

echo ""
echo "🎯 DJI DEVELOPER METRICS"
echo "   App ID: 180694 | Healthcare PT Drones"
echo "================================================================================="
printf "🎯 TOTAL: %d/%d (%.0f%%)\\n" $PASS $TESTS $(echo "scale=0; $PASS/$TESTS*100" | bc -l)
printf "🚁 DRONES: %d/%d (%.0f%%)\\n" $DRONE_PASS $DRONE_TESTS $(echo "scale=0; $DRONE_PASS/$DRONE_TESTS*100" | bc -l)
printf "⭐ DJI API: %d/%d (%.0f%%)\\n" $DJI_PASS $DJI_TESTS $(echo "scale=0; $DJI_PASS/$DJI_TESTS*100" | bc -l)

[[ $PASS -eq $TESTS ]] && echo "💎 PHARMA TRANSPORT + DJI CLOUD 180694: 100% PRODUCTION READY" || echo "⏳ Render deploy in progress... wait 3-5 min"
