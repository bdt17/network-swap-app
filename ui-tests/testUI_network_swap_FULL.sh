#!/bin/bash
# testUI_network_swap_FULL.sh - Thomas IT Network Swap App UI Tests (COMPLETE)

APP_URL="https://network-swap-app.onrender.com"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG="../logs/ui_test_network_swap_${TIMESTAMP}.txt"

echo "🎨 Testing Thomas IT Network Swap UI ($APP_URL)" | tee "$LOG"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

test_ui_endpoint() {
  echo -e "\n🎯 Testing UI: $1" | tee -a "$LOG"
  SIZE=$(curl -s -w "%{size_download}" -o /dev/null "$2" 2>/dev/null || echo "0")
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$2" 2>/dev/null || echo "0")
  echo "  Status: $STATUS | Size: ${SIZE}B" | tee -a "$LOG"
  if [ "$STATUS" = "200" ] && [ "$SIZE" -gt 10000 ]; then
    echo -e "  ${GREEN}✅ PASS${NC}" | tee -a "$LOG"
    return 0
  else
    echo -e "  ${RED}❌ FAIL${NC}" | tee -a "$LOG"
    return 1
  fi
}

test_tailwind() {
  echo -e "\n🎨 Tailwind CSS Check" | tee -a "$LOG"
  CLASSES=$(curl -s "$1" | grep -o 'bg-\|text-\|p[0-9-]\+\|flex\|grid' | wc -l)
  echo "  Tailwind classes: $CLASSES" | tee -a "$LOG"
  [ "$CLASSES" -gt 5 ] && echo -e "  ${GREEN}✅ PASS${NC}" || echo -e "  ${YELLOW}⚠️${NC}"
} | tee -a "$LOG"

test_page_speed() {
  echo -e "\n⚡ Page Speed" | tee -a "$LOG"
  curl -s -o /dev/null -w "Time: %{time_total}s\n" "$1" | tee -a "$LOG"
}

# RUN TESTS
test_page_speed "$APP_URL/"
test_ui_endpoint "Dashboard" "$APP_URL/"
test_tailwind "$APP_URL/"
test_ui_endpoint "Inventory" "$APP_URL/inventory"

echo -e "\n🎉 UI Tests COMPLETE - Check $LOG" | tee -a "$LOG"
