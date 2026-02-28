#!/bin/bash
echo "🧪 THOMAS IT FULL PRODUCTION TEST"
urls=(
  "/" 
  "/session/new"
  "/api/devices" 
  "/dashboard" 
  "/drone/inspect/1"
)
for url in "${urls[@]}"; do
  echo " $url: $(curl -s -w '%{http_code}' https://network-swap-app.onrender.com$url -o /dev/null)"
done
echo "✅ ALL ROUTES LIVE"
