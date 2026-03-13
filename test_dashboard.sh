#!/bin/bash
echo "🔥 THOMAS IT - API DASHBOARD TEST SUITE"
echo "═══════════════════════════════════════════════"

BASE_URL="https://network-swap-app.onrender.com"
echo "🟢 Testing: $BASE_URL"
echo ""

# Test 1: Tech Portal
echo "📱 [1/8] Tech Portal..."
if curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/tech" | grep -q 200; then
  echo "  ✅ LIVE (200 OK)"
else
  echo "  ❌ DOWN"
fi

# Test 2: AR Overlay  
echo "🕶️  [2/8] AR Glasses..."
if curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/ar" | grep -q 200; then
  echo "  ✅ LIVE (200 OK)"
else
  echo "  ❌ DOWN"
fi

# Test 3: Devices Index
echo "📊 [3/8] Devices API..."
RESPONSE=$(curl -s "$BASE_URL/api/devices")
if [[ $RESPONSE == *'"id":'* ]]; then
  echo "  ✅ LIVE - $(echo $RESPONSE | jq '. | length') devices"
else
  echo "  ❌ 500 ERROR"
fi

# Test 4: Device Health
echo "❤️ [4/8] Device Health..."
HEALTH=$(curl -s "$BASE_URL/api/devices/1/health")
if [[ $HEALTH == *"status"* ]]; then
  STATUS=$(echo $HEALTH | jq -r '.status')
  UPTIME=$(echo $HEALTH | jq -r '.uptime // empty')
  echo "  ✅ $STATUS ($UPTIME)"
else
  echo "  ❌ 500 ERROR"
fi

# Test 5: Drone Fleet
echo "🚁 [5/8] Drone Fleet..."
FLEET=$(curl -s "$BASE_URL/api/drones/fleet")
if [[ $FLEET == *'"name":'* ]]; then
  DRONES=$(echo $FLEET | jq '. | length')
  BATTERY=$(echo $FLEET | jq -r '.[0].battery')
  echo "  ✅ $DRONES drones - $BATTERY% battery"
else
  echo "  ❌ 500 ERROR"
fi

# Test 6: SMS Dispatch
echo "💬 [6/8] SMS Dispatch..."
SMS=$(curl -s -X POST -H "Content-Type: application/json" \
  -d '{"tech":"Smith,J","device":"C9300"}' \
  "$BASE_URL/api/dispatch_sms")
if [[ $SMS == *"success":true* ]]; then
  echo "  ✅ SMS dispatched"
else
  echo "  ❌ FAILED"
fi

# Test 7: System Health
echo "🔍 [7/8] System Health..."
HEALTH=$(curl -s "$BASE_URL/api/health")
if [[ $HEALTH == *"status":"ok"* ]]; then
  echo "  ✅ System healthy"
else
  echo "  ❌ DOWN"
fi

# Test 8: Export
echo "📄 [8/8] CSV Export..."
EXPORT=$(curl -s "$BASE_URL/api/devices/export")
if [[ $EXPORT == *"devices"* ]]; then
  echo "  ✅ Export ready ($(echo $EXPORT | jq '.devices | length') records)"
else
  echo "  ❌ FAILED"
fi

echo ""
echo "═══════════════════════════════════════════════"
echo "🎯 ENTERPRISE STATUS: $(curl -s "$BASE_URL/tech" -o /dev/null -w "%{http_code}" | grep -c 2 || echo 0)/8 APIs LIVE"
