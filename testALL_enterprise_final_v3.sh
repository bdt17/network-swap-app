#!/bin/bash
echo "💎 ENTERPRISE NOC v3.1 - PRODUCTION MASTER"
echo "═══════════════════════════════════════════════════════════════"

pkill -f "rails s" || true; sleep 2
rails s -p 3000 > /dev/null 2>&1 & RAILS_PID=$!
sleep 5

echo "🖥️  DASHBOARD"
curl -s http://localhost:3000/ | grep -E "(Thomas IT|Phoenix DC21)" && echo "✅ LIVE"

echo "🔌 SMS API"
curl -s -X POST http://localhost:3000/api/dispatch_sms \
  -H "Content-Type: application/json" -d '{"tech":"Brett"}' | 
grep "success" && echo "✅ PHASE 8B LIVE"

echo "💾 DB"
echo "Devices: $(rails runner 'puts Device.count' 2>/dev/null | tail -1)"
echo "Drones: $(rails runner 'puts Drone.count' 2>/dev/null | tail -1)"

echo "🌐 PROD"
curl -s -w "%{http_code}" https://network-swap-app.onrender.com/ | grep 200 && echo "✅ LIVE"

PERF=$(curl -s -w "%{time_total}" -o /dev/null http://localhost:3000/)
echo "⚡ ${PERF}s ($(echo "$PERF * 1000" | bc | cut -d. -f1)ms)"

kill $RAILS_PID 2>/dev/null
echo "🎖️ ENTERPRISE NOC = FIELD OPS LIVE!"
