#!/bin/bash
echo "🟢 STATIC APP (Field Ops) vs 🔴 DYNAMIC APP (Helpdesk)"
echo "================================================"

STATIC="https://network-swap-static.onrender.com"
DYNAMIC="https://network-swap-app.onrender.com"

test_app() {
  local app=$1 name=$2
  echo "Testing $name..."
  curl -s -o /dev/null -w "  /: %{http_code} | /tech: %{http_code} | /inventory: %{http_code}\n" "$app/" "$app/tech" "$app/inventory"
}

test_app $STATIC "🟢 STATIC (Field Ready)"
test_app $DYNAMIC "🔴 DYNAMIC (Helpdesk)"
