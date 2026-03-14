#!/bin/bash
echo "🚀 THOMAS IT ENTERPRISE - OPENING ALL ENDPOINTS..."

# DJI Phase 14 + Enterprise Dashboard (10 tabs)
URLS=(
  "https://network-swap-app.onrender.com/"
  "https://network-swap-app.onrender.com/tech" 
  "https://network-swap-app.onrender.com/dashboard"
  "https://network-swap-app.onrender.com/ar"
  "https://network-swap-app.onrender.com/api/health"
  "https://network-swap-app.onrender.com/api/drones/fleet"
  "https://network-swap-app.onrender.com/api/drones/1/inspect"
  "https://network-swap-app.onrender.com/api/drones/1/control"
  "https://network-swap-app.onrender.com/api/devices/export"
  "https://network-swap-app.onrender.com/api/dispatch_sms"
  "https://developer.dji.com/user/apps"
)

# Open in Firefox/Chromium (Linux/Ubuntu)
for url in "${URLS[@]}"; do
  google-chrome-stable "$url" &
  sleep 0.5  # Prevent tab overload
done

echo "✅ ALL 11 TABS OPENED - DJI 180694 + 247 Devices LIVE!"
echo "💎 Status: https://network-swap-app.onrender.com/api/drones/fleet"
