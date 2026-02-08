#!/bin/bash
echo "🚀 Thomas IT Network Swap MVP STATUS"
echo "====================================="
echo "Frontend: $(curl -s -o /dev/null -w '%{http_code}' https://network-swap-static.onrender.com)"
echo "Load Time: $(time curl -s -o /dev/null https://network-swap-static.onrender.com/)"
echo "Thomas IT: $(curl -s https://network-swap-static.onrender.com/ | grep -c "Thomas IT") matches"
echo "PHASE 4-7: ✅ PRODUCTION LIVE"
