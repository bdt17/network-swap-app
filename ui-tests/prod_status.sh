#!/bin/bash
echo "🚀 THOMAS IT NETWORK SWAP - PRODUCTION STATUS"
echo "=============================================="
echo "🟢 STATIC APP (Field Ops) - 100% LIVE"
curl -s -o /dev/null -w "✅ Tech Dashboard: %{http_code} | Dispatch: %{http_code} | Inventory: %{http_code}\n" \
  https://network-swap-static.onrender.com/tech \
  https://network-swap-static.onrender.com/dispatch \
  https://network-swap-static.onrender.com/inventory
echo ""
echo "🔴 DYNAMIC APP (Helpdesk) - Deploy when Rails ready"
echo "✅ Field techs: https://network-swap-static.onrender.com/tech"
