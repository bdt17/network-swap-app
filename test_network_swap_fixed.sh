#!/bin/bash
STATIC_URL="https://thomasit-network.netlify.app"  # Your static site
RAILS_URL="https://network-swap-app.onrender.com"

echo "🧪 THOMAS IT PHASE 4-7 PRODUCTION TEST"
echo "STATIC: $STATIC_URL"
echo "RAILS:  $RAILS_URL"
echo "="*60

# Test RAILS endpoints
for endpoint in "/" "/session/new" "/api/devices" "/dashboard" "/health"; do
  echo -n "RAILS $endpoint: "
  code=$(curl -s -o /dev/null -w "%{http_code}" -m 10 "$RAILS_URL$endpoint" -L)
  if [[ $code == "200" || $code == "302" ]]; then
    echo "✅ $code"
  else
    echo "❌ $code"
  fi
done

echo ""
echo "🎉 LOGIN: https://network-swap-app.onrender.com/session/new"
echo "   admin@thomasit.com / password123"
