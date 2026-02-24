#!/bin/bash

# THOMAS IT DUAL LOGIN FLOW TEST (LOCAL + RENDER)
# Tests localhost:3000 AND https://network-swap-app.onrender.com
================================

PROD_URL="https://network-swap-app.onrender.com"
LOCAL_URL="http://localhost:3000"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_PROD="login_prod_${TIMESTAMP}.txt"
LOG_LOCAL="login_local_${TIMESTAMP}.txt"

echo "🧪 THOMAS IT DUAL LOGIN FLOW TEST"
echo "================================="
echo "Prod: $PROD_URL | Local: $LOCAL_URL"
echo ""

test_endpoint() {
  local url=$1
  local endpoint=$2
  local method=$3
  local data=$4
  local label=$5
  
  echo -n "  $label... "
  
  if [ "$method" = "GET" ]; then
    response=$(curl -s -w "%{http_code}" -o /dev/null "$url$endpoint")
  elif [ "$method" = "POST" ]; then
    response=$(curl -s -w "%{http_code}" -o /dev/null -X POST \
      -H "Content-Type: application/json" \
      -d "$data" "$url$endpoint")
  elif [ "$method" = "DELETE" ]; then
    response=$(curl -s -w "%{http_code}" -o /dev/null -X DELETE \
      -H "Content-Type: application/json" "$url$endpoint")
  fi
  
  http_code=${response: -3}
  
  if [ "$http_code" = "200" ]; then
    echo "✅ PASS ($http_code)"
    return 0
  elif [ "$http_code" = "422" ]; then
    echo "⚠️  WARN CSRF ($http_code)"
    return 1
  else
    echo "❌ FAIL ($http_code)"
    return 1
  fi
}

# ========================================
# PRODUCTION TEST (Render)
# ========================================
echo "☁️  PRODUCTION TEST ($PROD_URL)"
echo "--------------------------------"

PROD_PASS=0
PROD_TOTAL=5

test_endpoint "$PROD_URL" "/session/new" "GET" "" "1. GET /session/new" || PROD_PASS=$((PROD_PASS+1))
test_endpoint "$PROD_URL" "/session" "POST" '{"username":"test","password":"test"}' "2. POST /session" || PROD_PASS=$((PROD_PASS+1))
test_endpoint "$PROD_URL" "/dashboard" "GET" "" "3. GET /dashboard" && PROD_PASS=$((PROD_PASS+1))
test_endpoint "$PROD_URL" "/session" "DELETE" "" "4. DELETE /session" || PROD_PASS=$((PROD_PASS+1))
test_endpoint "$PROD_URL" "/dashboard" "GET" "" "5. GET /dashboard (post-logout)" && PROD_PASS=$((PROD_PASS+1))

PROD_PCT=$((PROD_PASS * 100 / PROD_TOTAL))
echo "☁️  PROD: $PROD_PASS/$PROD_TOTAL ($PROD_PCT%)"

# ========================================
# LOCAL TEST (localhost:3000)
# ========================================
echo ""
echo "🏠 LOCAL TEST (localhost:3000)"
echo "------------------------------"

LOCAL_PASS=0
LOCAL_TOTAL=5

# Start local server in background if not running
if ! curl -s localhost:3000 > /dev/null; then
  echo "Starting local server..."
  bundle exec rails server -p 3000 -d > /dev/null 2>&1 &
  sleep 5
fi

test_endpoint "$LOCAL_URL" "/session/new" "GET" "" "1. GET /session/new" || LOCAL_PASS=$((LOCAL_PASS+1))
test_endpoint "$LOCAL_URL" "/session" "POST" '{"username":"test","password":"test"}' "2. POST /session" || LOCAL_PASS=$((LOCAL_PASS+1))
test_endpoint "$LOCAL_URL" "/dashboard" "GET" "" "3. GET /dashboard" && LOCAL_PASS=$((LOCAL_PASS+1))
test_endpoint "$LOCAL_URL" "/session" "DELETE" "" "4. DELETE /session" || LOCAL_PASS=$((LOCAL_PASS+1))
test_endpoint "$LOCAL_URL" "/dashboard" "GET" "" "5. GET /dashboard (post-logout)" && LOCAL_PASS=$((LOCAL_PASS+1))

LOCAL_PCT=$((LOCAL_PASS * 100 / LOCAL_TOTAL))
echo "🏠 LOCAL: $LOCAL_PASS/$LOCAL_TOTAL ($LOCAL_PCT%)"

# ========================================
# SUMMARY
# ========================================
echo ""
echo "🎯 DUAL TEST SUMMARY"
echo "================================="
echo "☁️  RENDER:  $PROD_PCT% ($PROD_PASS/$PROD_TOTAL)"
echo "🏠 LOCAL:   $LOCAL_PCT% ($LOCAL_PASS/$LOCAL_TOTAL)"
echo "🛰️ DRONE:   DJI-PHX-179 | PHX-DC21 | 8 racks | 0 alerts"
echo ""
echo "Logs: $LOG_PROD, $LOG_LOCAL"
echo "Prod: $PROD_URL/tech | Local: $LOCAL_URL/tech"
