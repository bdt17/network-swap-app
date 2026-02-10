#!/bin/bash
echo "🚀 THOMAS IT FIELD STATUS"
echo "========================="
STATIC="https://network-swap-static.onrender.com"
for page in tech dispatch inventory ar drones; do
  code=$(curl -s -o /dev/null -w "%{http_code}" "$STATIC/$page")
  [[ $code == 200 ]] && echo "✅ $page: LIVE" || echo "❌ $page: DOWN"
done
echo "📱 Field techs: https://network-swap-static.onrender.com/tech"
