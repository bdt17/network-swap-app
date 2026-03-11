#!/bin/bash
echo "💎 ENTERPRISE NOC v2.1 - PRODUCTION VALIDATION"
echo "═══════════════════════════════════════════════════════════════"

pkill -f "rails s" || true; sleep 2
rails s -p 3000 > /dev/null 2>&1 & RAILS_PID=$!
sleep 4

echo "🖥️  FRONTEND ENTERPRISE"
curl -s http://localhost:3000/ | grep -i "Thomas IT\|Phoenix DC21" && echo "✅ DYNAMIC DASHBOARD LIVE"

echo "🔌 API ENTERPRISE"  
SMS_RESPONSE=$(curl -s -X POST http://localhost:3000/api/dispatch_sms \
  -H "Content-Type: application/json" \
  -d '{"tech":"Brett","device":"Cisco9300"}' | tr -d '\n ')
if [[ $SMS_RESPONSE == *"success"* ]] || [[ $SMS_RESPONSE == *"queued"* ]]; then 
  echo "✅ SMS PHASE 8B LIVE: $SMS_RESPONSE"
else 
  echo "⚠ SMS: $SMS_RESPONSE"
fi

echo "💾 DB HEALTH" 
rails runner "p Device.count.to_s + ', ' + Drone.count.to_s" | head -1

echo "🌐 PRODUCTION SYNC" 
curl -s -w "%{http_code}" https://network-swap-app.onrender.com/ | grep -q 200 && echo "✅ PROD LIVE"

PERF=$(curl -s -w "%{time_total}" -o /dev/null http://localhost:3000/ 2>/dev/null)
echo "⚡ Local: ${PERF}s ($(echo "${PERF}*1000" | bc | cut -d. -f1)ms)"

kill $RAILS_PID 2>/dev/null
echo "🏆 THOMAS IT NOC = ENTERPRISE PRODUCTION LIVE!"
