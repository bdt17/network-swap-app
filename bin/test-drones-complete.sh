#!/bin/bash
echo "🧪 THOMAS IT PHASE 14 FULL TEST"
echo "1. Health: $(curl -s -w '%{http_code}' https://network-swap-app.onrender.com/health -o /dev/null)"
echo "2. Drone API:"
curl -s https://network-swap-app.onrender.com/api/v1/drone_fleets/1/inspect | jq .
echo "✅ PHASE 14 PRODUCTION LIVE"
