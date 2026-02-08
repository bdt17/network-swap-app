#!/usr/bin/env bash
set -e

echo "🧪 Thomas IT Network Swap - PRODUCTION TESTS"
echo "=================================================="

echo "🌐 1. STATIC FRONTEND (network-swap-static.onrender.com)"
curl -s https://network-swap-static.onrender.com/ | grep -i "Thomas IT" \
  && echo "✅ Frontend LIVE" \
  || echo "❌ Frontend DOWN"

echo
echo "📊 2. RAILS API STATUS (network-swap-app.onrender.com)"
curl -s https://network-swap-app.onrender.com/api/status || echo "❌ Status API DOWN (blocked)"

echo
echo "🔢 3. DEVICES API"
curl -s https://network-swap-app.onrender.com/api/devices || echo "❌ Devices API DOWN (blocked)"

echo
echo "🎉 SUMMARY"
echo "Static Frontend: $(curl -s -o /dev/null -w '%{http_code}' https://network-swap-static.onrender.com/)"
echo "Rails API:       $(curl -s -o /dev/null -w '%{http_code}' https://network-swap-app.onrender.com/api/status)"
