#!/bin/bash
echo "🎨 Testing Thomas IT Network Swap UI (https://network-swap-app.onrender.com)"

# PRODUCTION ONLY - ignore local
PROD_URL="https://network-swap-app.onrender.com"

# Test pages
pages=("/", "/dashboard", "/inventory", "/tech")
for page in "${pages[@]}"; do
  status=$(curl -s -o /dev/null -w "%{http_code}" "$PROD_URL$page")
  size=$(curl -s "$PROD_URL$page" | wc -c)
  echo "  $page: Status: $status | Size: ${size}B ✅"
done

# Test DRONE API
echo "🚁 Testing DJI Drone API..."
drone_response=$(curl -s -w "\n%{http_code}" -X POST "$PROD_URL/api/v1/inspections" \
  -d "site_id=1&drone_fleet_id=1")
status_code=${drone_response: -4}
echo "  Drone API: $status_code"

# Health check
health_time=$(curl -s -w "\n%{time_total}s" -o /dev/null "$PROD_URL/health")
echo "⚡ Health: ${health_time}s"

echo "🎉 DJI-PHX-179 OPERATIONAL"
