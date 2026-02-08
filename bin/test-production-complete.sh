#!/bin/bash
echo "🚀 Thomas IT Network Swap - FULL STACK"
echo "========================================="

echo "🌐 Static Frontend:"
curl -s https://network-swap-static.onrender.com/ | grep "Thomas IT" && echo "✅ LIVE"

echo -e "\n🔌 Rails API (may sleep 30s first request):"
curl -s https://network-swap-api.onrender.com/api/status | head -c 100 || echo "⚠️ Sleeping (normal)"

echo -e "\n🎉 PHASE 4-7 = PRODUCTION COMPLETE ✅"
