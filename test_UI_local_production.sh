#!/bin/bash
echo "🧪 THOMAS IT PHASE 14/10 - LOCAL vs PRODUCTION COMPARISON"
echo "======================================================================"

RED='\033[0;31m' GREEN='\033[0;32m' YELLOW='\033[1;33m' NC='\033[0m'
LOCAL_PORT=3001
PROD_URL="https://network-swap-app.onrender.com"  # UPDATE THIS!

PAGES=( "/tech" "/enterprise" "/eol_swaps" "/dashboard" "/inventory" "/sites" "/field_techs" )

echo "🚀 LOCAL: http://localhost:${LOCAL_PORT}"
echo "🌐 PROD: ${PROD_URL}"
echo "======================================================================"

LOCAL_OK=0 PROD_OK=0 TOTAL_PAGES=${#PAGES[@]}

for page in "${PAGES[@]}"; do
  # Local test
  if curl -s -m 5 -o /dev/null -w "%{http_code}" "http://localhost:${LOCAL_PORT}${page}" | grep -q "^200"; then
    echo -e "${GREEN}✅ LOCAL${NC} ${page}"
    ((LOCAL_OK++))
  else
    echo -e "${RED}❌ LOCAL${NC} ${page}"
  fi
  
  # Prod test (timeout 10s for Render)
  if curl -s -m 10 -o /dev/null -w "%{http_code}" "${PROD_URL}${page}" | grep -q "^200"; then
    echo -e "   ${GREEN}✅ PROD${NC}"
    ((PROD_OK++))
  else
    echo -e "   ${YELLOW}❌ PROD${NC}"
  fi
done

echo ""
echo "📊 RESULTS: LOCAL ${LOCAL_OK}/${TOTAL_PAGES} | PROD ${PROD_OK}/${TOTAL_PAGES}"
if [ $LOCAL_OK -eq $TOTAL_PAGES ] && [ $PROD_OK -eq $TOTAL_PAGES ]; then
  echo -e "${GREEN}🎉 FULL PRODUCTION MATCH!${NC}"
else
  echo -e "${YELLOW}⚠️  Deploy after fixes${NC}"
fi

echo ""
echo "🚀 DEPLOY: git add . && git commit -m 'Phase 14 LIVE' && render deploy"
