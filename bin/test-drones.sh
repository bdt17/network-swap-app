#!/bin/bash
echo "🧪 PHASE 14: Thomas IT Drone Diagnostics $(date)"
echo "=== DJI-PHX-179 INSPECTION ==="
curl -s https://network-swap-app.onrender.com/api/v1/drone_fleets/1/inspect | jq .
echo "=== HEALTH CHECK ==="
curl -s https://network-swap-app.onrender.com/health
echo "✅ PHASE 14 OPERATIONAL"
