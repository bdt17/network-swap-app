#!/bin/bash
echo "🧪 THOMAS IT NETWORK SWAP - FULL TEST SUITE"
echo "═══════════════════════════════════════════════"
echo "LOCAL: http://localhost:3000"
echo "PROD: https://network-swap-app.onrender.com"
echo ""
echo "API STATUS:"
curl -s https://network-swap-app.onrender.com/api/status
echo ""
echo "DEVICES: $(curl -s https://network-swap-app.onrender.com/api/devices | jq 'length')"
echo "DRONES: $(curl -s https://network-swap-app.onrender.com/api/drones)"
echo ""
echo "LOCAL TESTS:"
./test_all_localPages.rb
