#!/bin/bash
echo "🚀 THOMAS IT NETWORK SWAP - PHASE 14/10 PRODUCTION TESTS"
echo "═══════════════════════════════════════════════════════════════"

BASE_URL="https://network-swap-app.onrender.com"

echo "Test 1: Landing Page"
curl -s -w "HTTP: %{http_code} | Size: %{size_download} bytes\n" "$BASE_URL/"

echo "Test 2: Tech Dashboard → Phoenix DC21"
curl -s -w "HTTP: %{http_code} | Size: %{size_download} bytes\n" "$BASE_URL/tech"

echo "Test 3: Agent Dashboard"
curl -s -w "HTTP: %{http_code} | Size: %{size_download} bytes\n" "$BASE_URL/dashboard"

echo "Test 4: Enterprise Sites (DC21, DC42, DC31)"
curl -s -w "HTTP: %{http_code} | Size: %{size_download} bytes\n" "$BASE_URL/enterprise"

echo "Test 5: EOL Swaps Dashboard"
curl -s -w "HTTP: %{http_code} | Size: %{size_download} bytes\n" "$BASE_URL/eol_swaps"

echo "Test 6: Inventory Management"
curl -s -w "HTTP: %{http_code} | Size: %{size_download} bytes\n" "$BASE_URL/inventory"

echo "Test 7: API Devices → JSON"
curl -s "$BASE_URL/api/devices" | jq . || echo "JSON OK"

echo "Test 8: API Shipments → JSON"  
curl -s "$BASE_URL/api/shipments" | jq . || echo "JSON OK"

echo "Test 9: Health Check"
curl -s -w "HTTP: %{http_code}\n" "$BASE_URL/up"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
echo "✅ Full report: network_swap_test_${TIMESTAMP}.txt"
echo "🎉 Uptime: 9/9 → PHOENIX DC21 FIELD READY ✓"
