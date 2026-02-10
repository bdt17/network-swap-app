#!/bin/bash
echo "🧪 THOMAS IT STATUS - CLEAN VIEW"
echo "================================="
STATIC="https://network-swap-static.onrender.com"
echo "🟢 FIELD OPS (STATIC):"
curl -s -o /dev/null -w "✅ Tech:%{http_code} Dispatch:%{http_code} Inventory:%{http_code}\n" \
  "$STATIC/tech" "$STATIC/dispatch" "$STATIC/inventory"
