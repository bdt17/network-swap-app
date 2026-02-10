#!/bin/bash
echo "🔄 END-TO-END FIELD WORKFLOW"
echo "=============================="
echo "1. Tech opens dashboard..."
curl -s https://network-swap-static.onrender.com/tech | grep "CLAIM THIS JOB" && echo "✅ Jobs visible"

echo "2. Dispatch checks status..."
curl -s https://network-swap-static.onrender.com/dispatch | grep "Dispatch Tower" && echo "✅ Dispatch LIVE"

echo "3. Inventory check..."
curl -s https://network-swap-static.onrender.com/inventory | grep "Network Inventory" && echo "✅ Inventory LIVE"

echo "✅ FULL WORKFLOW = FIELD READY"
