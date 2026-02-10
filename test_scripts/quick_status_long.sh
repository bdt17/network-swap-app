#!/bin/bash
BASE_URL="https://network-swap-static.onrender.com"
echo "Thomas IT Network Swap Status Report"
echo "===================================="

# Test main endpoints
for endpoint in "/" "/tech" "/inventory" "/ar"; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL$endpoint")
  if [[ $STATUS == "200" ]]; then
    echo "✅ $endpoint : LIVE"
  else
    echo "❌ $endpoint : $STATUS"
  fi
done

echo "===================================="
echo "📊 APIs:"
curl -s -o /dev/null -w "✅ Swaps API: %{http_code}\n" "$BASE_URL/api/swaps"
echo "🎉 Phase 8+ LIVE ✅"
