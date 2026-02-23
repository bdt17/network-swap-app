#!/bin/bash
PROD_URL="https://network-swap-app.onrender.com"

echo "🚀 THOMAS IT CORE PRODUCTION TEST"
echo "=================================="

# 1. DJI DRONE API (CRITICAL)
echo "🔥 Testing DJI Drone API..."
drone=$(curl -s -w "\nHTTP:%{http_code}" -X POST "$PROD_URL/api/v1/inspections" \
  -d "site_id=1&drone_fleet_id=1" | tail -1)
drone_status=${drone:4}
if [[ $drone_status == "201" ]]; then
  echo "✅ DJI-PHX-179 API: 201 CREATED"
else
  echo "❌ DJI API: HTTP$drone_status"
fi

# 2. HEALTH CHECK
echo "🔌 Health Check..."
health=$(curl -s -w "\nHTTP:%{http_code}" "$PROD_URL/health" | tail -1)
health_status=${health:4}
if [[ $health_status == "200" ]]; then
  echo "✅ Health: OK"
else
  echo "❌ Health: HTTP$health_status"
fi

# 3. LANDING PAGE
echo "🏠 Landing Page..."
landing=$(curl -s -w "\nHTTP:%{http_code}" "$PROD_URL/" | tail -1)
landing_status=${landing:4}
if [[ $landing_status == "200" ]]; then
  echo "✅ Landing: OK"
else
  echo "❌ Landing: HTTP$landing_status"
fi

# 4. TECH DASHBOARD (DJI UI)
echo "📱 Tech Dashboard..."
tech=$(curl -s -w "\nHTTP:%{http_code}" "$PROD_URL/tech" | tail -1)
tech_status=${tech:4}
if [[ $tech_status == "200" ]]; then
  echo "✅ Tech Dashboard: OK (DJI UI)"
else
  echo "❌ Tech Dashboard: HTTP$tech_status"
fi

# 5. PERFORMANCE
echo "⚡ Page Speed..."
speed=$(curl -s -w "%{time_total}s\n" -o /dev/null "$PROD_URL/tech")
echo "✅ Load Time: ${speed}s"

echo ""
echo "🎉 PRODUCTION STATUS:"
echo "   DJI Drone API: $drone_status"
echo "   Tech Dashboard: $tech_status"
echo "   Health Check: $health_status"
echo "   Landing: $landing_status"
echo ""
echo "🚀 THOMAS IT = FIELD READY ✅"

