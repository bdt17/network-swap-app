#!/bin/bash
echo "🔥 THOMAS IT NOC - PRODUCTION TEST v2.0"
echo "═══════════════════════════════════════════════"

BASE="https://network-swap-app.onrender.com"
LIVE=0
TOTAL=8

test_endpoint() {
  local name=$1
  local url=$2
  echo -n "  $name... "
  if curl -s -f -o /dev/null "$url"; then
    echo "✅ LIVE"
    ((LIVE++))
  else
    echo "❌ 500/404"
  fi
}

echo "🟢 Testing Production: $BASE"
echo ""

test_endpoint "📱 Tech Portal" "$BASE/tech"
test_endpoint "🕶️  AR Overlay" "$BASE/ar" 
test_endpoint "📊 Devices List" "$BASE/api/devices"
test_endpoint "❤️ Device Health" "$BASE/api/devices/1/health"
test_endpoint "🚁 Drone Fleet" "$BASE/api/drones/fleet"
test_endpoint "💬 SMS Dispatch" "$BASE/api/dispatch_sms" || echo "  💬 SMS needs POST"
test_endpoint "🔍 System Health" "$BASE/api/health"
test_endpoint "📄 CSV Export" "$BASE/api/devices/export"

echo ""
echo "═══════════════════════════════════════════════"
echo "🎯 STATUS: $LIVE/$TOTAL APIs LIVE ($(bc -l <<< "$LIVE/$TOTAL*100")%)"
if [ $LIVE -eq $TOTAL ]; then
  echo "✅ PHARMA TRANSPORT ENTERPRISE READY!"
else
  echo "🔧 Check Render Logs: https://dashboard.render.com"
fi
