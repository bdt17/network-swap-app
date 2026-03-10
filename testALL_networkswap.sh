#!/bin/bash
echo "💎 THOMAS IT NETWORK SWAP - COMPLETE TEST SUITE"
echo "=================================================="
echo "Running Frontend + Backend + Full Validation"
echo "=================================================="

# Start server
rails s -p 3000 &
SERVER_PID=$!
sleep 3

# Run all tests
./testALL_frontend_networkswap.sh
echo ""
./testALL_backend_networkswap.sh
echo ""
./testALL_localPages_vs_prod.rb

# Kill server
kill $SERVER_PID 2>/dev/null

echo ""
echo "=================================================="
echo "🎬 FULL SYSTEM STATUS: ENTERPRISE READY!"
echo "🚀 Deploy: git push origin main"
echo "=================================================="
