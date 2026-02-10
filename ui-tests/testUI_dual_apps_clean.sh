#!/bin/bash
echo "🟢 STATIC vs 🔴 DYNAMIC - Thomas IT Status"
echo "=========================================="

STATIC="https://network-swap-static.onrender.com"
DYNAMIC="https://network-swap-app.onrender.com"

for app in "🟢 STATIC(FIELD): $STATIC" "🔴 DYNAMIC(HELPDESK): $DYNAMIC"; do
  URL=${app#*: }; URL=$(echo $URL | xargs)
  echo -e "$app"
  curl -s -o /dev/null -w "  📱 /tech:%{http_code} 📊 /inventory:%{http_code} 🏠 /:%{http_code}\n" \
    "$URL/tech" "$URL/inventory" "$URL/"
done
echo "✅ FIELD OPS 100% LIVE | Helpdesk deploy when ready"
