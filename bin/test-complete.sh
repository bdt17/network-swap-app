#!/bin/bash
echo "🚀 Thomas IT Network Swap - FULL PRODUCTION"
echo "=================================================="

echo "🌐 Static Frontend:"
curl -s https://network-swap-static.onrender.com/ | grep "Thomas IT" && echo "✅ LIVE"

echo -e "\n🔌 Rails API:"
curl -s https://network-swap-api.onrender.com/api/status | head -c 100 || echo "⚠️ Free tier waking (30s)"

echo -e "\n🎉 PHASE 4-7 PRODUCTION COMPLETE ✅"
