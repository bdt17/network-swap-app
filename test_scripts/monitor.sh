#!/bin/bash
URL="https://network-swap-app-final.onrender.com"
while true; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL/up")
  if [ "$STATUS" = "200" ]; then
    echo "$(date): ✅ Thomas IT LIVE ($STATUS)"
  else
    echo "$(date): ❌ DOWN ($STATUS)" && break
  fi
  sleep 5
done
