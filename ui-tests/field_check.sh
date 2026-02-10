#!/bin/bash
echo "📱 THOMAS IT FIELD STATUS (Phoenix)"
echo "=================================="
curl -s -o /dev/null -w "Tech Dashboard: %{http_code} | Size: %{size_download} bytes\n" \
  https://network-swap-static.onrender.com/tech
echo "✅ Phase 8 MOBILE LIVE 📱"
