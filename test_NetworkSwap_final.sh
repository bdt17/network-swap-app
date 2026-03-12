#!/bin/bash
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
BASE_URL="http://localhost:3000"
TIMEOUT=15

echo -e "${YELLOW}🌐 NetworkSwap Dashboard - LIVE SERVER TEST${NC}"
echo "Server: ${BASE_URL} | Timeout: ${TIMEOUT}s"

test_page() {
    local path=$1 name=$2
    echo -n "  ${YELLOW}🔍 $name${NC}... "
    local resp=$(curl -s -w "\nSTATUS:%{http_code}\nSIZE:%{size_download}" \
        -m $TIMEOUT -o "/tmp/${name//[^a-z]}.html" "$BASE_URL$path" 2>/dev/null)
    status=$(echo "$resp" | grep STATUS | cut -d: -f2)
    size=$(echo "$resp" | grep SIZE | cut -d: -f2)
    
    if [[ "$status" == "200" && "$size" -gt 1000 ]]; then
        echo -e "${GREEN}✅ PASS ($size B)${NC}"
    elif [[ "$status" == "200" ]]; then
        echo -e "${YELLOW}⚠️  LOADED ($size B)${NC}"
    elif [[ "$status" == "302" ]]; then
        echo -e "${GREEN}🔄 REDIRECT${NC}"
    else
        echo -e "${RED}❌ $status${NC}"
    fi
}

echo "📋 TESTING YOUR 9 ROUTES + FEATURES"
echo "====================================="

# CORE PAGES (your working ones)
test_page "/" "Home"
test_page "/dashboard" "Dashboard" 

# AUTH (Devise patterns for Rails 8.1)
test_page "/users/sign_in" "Login"
test_page "/users/sign_up" "Register"

# NETWORKSWAP FEATURES (your domain)
test_page "/networks" "Networks"
test_page "/swaps" "Swaps" 
test_page "/devices" "Devices"
test_page "/status" "Status"

# API (once routes fixed)
test_page "/api/dispatch_sms" "SMS API" 
test_page "/api/networks" "API Networks"

# CONTENT CHECK
echo -e "\n📊 DASHBOARD CONTENT ANALYSIS:"
curl -s "$BASE_URL/" -o /tmp/dashboard.html
echo "Keywords found:"
grep -ioE "network|swap|device|status|dashboard|tail" /tmp/dashboard.html | \
    sort | uniq -c | sort -nr | head -8

echo -e "\n${GREEN}✅ COMPLETE! Check /tmp/*.html files${NC}"
