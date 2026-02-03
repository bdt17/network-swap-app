#!/bin/bash
APP_URL="https://network-swap-app-final.onrender.com"
rm -f test.log network_swap_test_*.txt

echo "🚀 Testing Thomas IT Production ($APP_URL)..."

# Test multiple endpoints
echo "Test 1-5: Root page (/)..."
for i in {1..5}; do
  echo "Test $i..."
  curl -s -m 30 -w "code:%{http_code} BYTES:%{size_download} TIME:%{time_total}s\n" \
    "$APP_URL" >> test.log
done

echo "Test 6: /up healthcheck..."
curl -s -m 30 -w "code:%{http_code} BYTES:%{size_download} TIME:%{time_total}s\n" \
  "$APP_URL/up" >> test.log

echo "Test 7: /dashboard..."
curl -s -m 30 -w "code:%{http_code} BYTES:%{size_download} TIME:%{time_total}s\n" \
  "$APP_URL/dashboard" >> test.log

# Analyze results
OK=$(grep -c "code:200" test.log || echo 0)
AVG_TIME=$(grep "TIME:" test.log | awk '{sum+=$NF; n++} END {if(n>0) printf "%.2f", sum/n; else print "N/A"}')
AVG_BYTES=$(grep "BYTES:" test.log | awk '{sum+=$2; n++} END {if(n>0) printf "%.0f", sum/n; else print "N/A"}')

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
cp test.log "network_swap_test_${TIMESTAMP}.txt"

echo ""
echo "✅ Full report: network_swap_test_${TIMESTAMP}.txt"
echo "🎉 Uptime: ${OK}/7 (200 OK)"
echo "📊 Avg Response Time: ${AVG_TIME}s"
echo "📏 Avg Response Size: ${AVG_BYTES} bytes"
echo ""
echo "Expected SUCCESS:"
echo "  - Uptime: 7/7 ✓"
echo "  - Avg Time: <2s ✓" 
echo "  - Root: ~450 bytes ✓"
echo "  - /up: ~30 bytes ✓"
echo "  - Dashboard: ~350 bytes ✓"
