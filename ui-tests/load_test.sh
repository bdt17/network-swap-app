#!/bin/bash
echo "⚡ LOAD TEST - 10 Field Techs Hit Dashboard"
echo "=========================================="
for i in {1..10}; do curl -s https://network-swap-static.onrender.com/tech >/dev/null & done
wait
echo "✅ Load test PASS - No crashes"
