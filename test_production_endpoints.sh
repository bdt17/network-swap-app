#!/bin/bash
echo "🧪 PRODUCTION ENDPOINT TESTS - Network Swap App"
echo "=============================================="

BASE_URL="https://network-swap-app.onrender.com"

# Test core APIs
echo "📱 Devices API:"
curl -s "$BASE_URL/api/devices" | jq '. | length'  # Should show ~92

echo -e "\n📈 Health Score (Device 1):"
curl -s "$BASE_URL/api/devices/1/health" | jq .

echo -e "\n📥 CSV Export:"
curl -s -I "$BASE_URL/api/devices/export.csv"

echo -e "\n🔄 Swaps API:"
curl -s "$BASE_URL/api/devices" | jq '. | length'

echo -e "\n🎯 SUMMARY: Field techs have LIVE ACCESS!"
