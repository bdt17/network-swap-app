#!/bin/bash
echo "🧪 THOMAS IT NOC DASHBOARD v2.0 - ROUTE DISCOVERY TEST SUITE"
echo "======================================================================"

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

# Config - PROMPT for manual server start
APP_PORT=3000
BASE_URL="http://localhost:${APP_PORT}"
TIMEOUT=10

echo -e "${YELLOW}⚠️  MANUAL SERVER START REQUIRED${NC}"
echo "🔥 Run this FIRST in another terminal:"
echo "   cd ~/network-swap-app && bundle exec rails s -p ${APP_PORT}"
echo -e "${YELLOW}⏳ Press Enter when server is running on port ${APP_PORT}...${NC}"
read -r

# Test 1: Discover ALL routes dynamically
echo -e "${YELLOW}🔍 DISCOVERING ALL ROUTES...${NC}"
ROUTES=$(curl -s ${BASE_URL}/rails/info/routes 2>/dev/null | grep -E '^(GET|POST|PUT|DELETE)' | head -20)
if [[ -z "$ROUTES" ]]; then
    echo -e "${RED}❌ Cannot access /rails/info/routes - run 'rails routes' manually${NC}"
    echo "📋 Showing your actual routes:"
    bundle exec rails routes | head -20
    exit 1
fi

echo "$ROUTES"
echo "======================================================================"

# Test 2: Core NetworkSwap features (based on your app context)
echo "🚀 TESTING NETWORKSWAP FEATURES"

test_endpoint() {
    local endpoint=$1 label=$2 expected=${3:-200}
    echo -n "🔍 ${label}... "
    local resp=$(curl -s -w "\nHTTP:%{http_code}\nSIZE:%{size_download}" -m $TIMEOUT \
        -o /tmp/${label//[^a-zA-Z0-9]/_}.html "${BASE_URL}${endpoint}")
    local status=$(echo "$resp" | grep HTTP: | cut -d: -f2 | tr -d ' ')
    local size=$(echo "$resp" | grep SIZE: | cut -d: -f2)
    
    if [[ "$status" == "$expected" && "$size" -gt 500 ]]; then
        echo -e "${GREEN}✅ PASS (${status}, ${size}B)${NC}"
        return 0
    else
        echo -e "${RED}❌ FAIL (${status}, ${size}B)${NC}"
        return 1
    fi
}

# NetworkSwap specific tests
test_networkswap_features() {
    echo -e "${YELLOW}🌐 NETWORKSWAP FEATURES${NC}"
    
    # Root + Dashboard (WORKING)
    test_endpoint "/" "Home/Dashboard" 200
    
    # Common Rails auth patterns
    test_endpoint "/users/sign_in" "User Sign In" "200|302" || true
    test_endpoint "/devise/sessions" "Devise Sessions" "200|302" || true
    
    # NetworkSwap specific (your domain)
    test_endpoint "/networks" "Networks List" "200|302" || true
    test_endpoint "/swaps" "Swaps" "200|302" || true
    test_endpoint "/devices" "Devices" "200|302" || true
    test_endpoint "/status" "Status" || true
    
    # API endpoints
    test_endpoint "/api/v1/networks" "API Networks" || true
    test_endpoint "/api/status" "API Status" || true
}

# Test 3: Content analysis (what's actually ON the pages)
test_content_features() {
    echo -e "${YELLOW}📊 CONTENT ANALYSIS${NC}"
    curl -s ${BASE_URL}/ -o /tmp/dashboard.html
    
    # Check for NetworkSwap elements
    grep -qi "network\|swap\|device" /tmp/dashboard.html && echo -e "${GREEN}✅ PASS Network content${NC}" || echo -e "${YELLOW}⚠️  No network content${NC}"
    grep -qi "tailwind" /tmp/dashboard.html && echo -e "${GREEN}✅ PASS Tailwind UI${NC}" || echo -e "${YELLOW}⚠️  No Tailwind${NC}"
    
    echo "📋 Top keywords found:"
    grep -ioE "(network|swap|device|status|dashboard)" /tmp/dashboard.html | sort | uniq -c | sort -nr | head -5
}

# Test 4: Fix the routes.rb post() error
echo -e "${YELLOW}🔧 CHECKING ROUTES.RB ERROR${NC}"
if grep -i "post.*undefined method" log/development.log 2>/dev/null; then
    echo -e "${RED}🚨 ROUTES.RB LINE 28 ERROR DETECTED${NC}"
    echo "💡 Fix: Replace 'post" with 'post :' in config/routes.rb:28"
    echo "   sed -i '28s/post/post :/' config/routes.rb"
fi

# RUN ALL TESTS
test_networkswap_features
test_content_features

echo "======================================================================"
echo -e "${GREEN}✅ FULL FEATURE TEST COMPLETE${NC}"
echo "📁 Debug files: /tmp/*.html"
echo "🔍 Run 'rails routes' to see ALL your routes"
