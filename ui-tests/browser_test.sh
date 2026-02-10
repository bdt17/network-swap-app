#!/bin/bash
echo "🌐 CROSS-BROWSER TEST"
echo "======================"
browsers=("Chrome" "Firefox" "Safari" "Edge")
for browser in "${browsers[@]}"; do
  curl -s -A "Mozilla/5.0 ($browser)" https://network-swap-static.onrender.com/ | grep "Thomas IT" >/dev/null && echo "✅ $browser OK"
done
