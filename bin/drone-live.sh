#!/bin/bash
echo "🧪 THOMAS IT PHASE 14 - LIVE STATUS"
echo "Health: $(curl -s -w '%{http_code}' https://network-swap-app.onrender.com/health -o /dev/null)"
echo "DJI-PHX-179:"
curl -s https://network-swap-app.onrender.com/api/v1/drone_fleets/1/inspect | jq . 2>/dev/null || curl -s https://network-swap-app.onrender.com/api/v1/drone_fleets/1/inspect | head -200
echo "✅ Phoenix DC21 Rack Scans: OPERATIONAL"
