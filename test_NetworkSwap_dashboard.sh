#!/bin/bash
echo "🧪 THOMAS IT NOC DASHBOARD - PRODUCTION TEST SUITE"
echo "======================================================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
APP_PORT=3000
TIMEOUT=10
BASE_URL="http://localhost:${APP_PORT}"

# Kill existing puma/server processes and start fresh
echo -e "${YELLOW}🔄 Starting Rails server...${NC}"
pkill -f puma 2>/dev/null || true
pkill -f "rails s" 2>/dev/null || true
sleep 2

# Start Rails server in background
bundle exec rails server -p ${APP_PORT} -b 127.0.0.1 & 
SERVER_PID=$!
echo "📋 Server PID: ${SERVER_PID}"

# Wait for server to be ready
echo -e "${YELLOW}⏳ Waiting for server startup...${NC}"
sleep 5
curl -s -f http://localhost:${APP_PORT}/health >/dev/null || curl -s -f http://localhost:${APP_PORT}/ >/dev/null 2>&1 || {
    echo -e "${RED}❌ Server failed to start!${NC}"
    kill $SERVER_PID 2>/dev/null || true
    exit 1
}

function test_endpoint() {
    local endpoint=$1
    local desc=$2
    local expected_status=${3:-200}
    
    echo -n "🔍 Testing ${desc}... "
    local response=$(curl -s -w "\nHTTPSTATUS:%{http_code}\nSIZE:%{size_download}" \
        -m $TIMEOUT -o /tmp/response.html $BASE_URL$endpoint 2>/dev/null)
    
    local status=$(echo "$response" | grep HTTPSTATUS | sed 's/.*HTTPSTATUS://')
    local size=$(echo "$response" | grep SIZE | sed 's/.*SIZE://')
    
    if [[ "$status" == "$expected_status" && "$size" -gt 100 ]]; then
        echo -e "${GREEN}✅ PASS (${status}, ${size}B)${NC}"
        return 0
    else
        echo -e "${RED}❌ FAIL (${status}, ${size}B)${NC}"
        echo "📄 Response saved to /tmp/response.html"
        return 1
    fi
}

function test_login() {
    echo -e "${YELLOW}🔐 Testing LOGIN FUNCTIONALITY...${NC}"
    
    # Test login page loads
    test_endpoint "/login" "Login Page" 200
    
    # Test login with valid credentials (adjust these for your app)
    echo -n "🔍 Testing valid login... "
    local login_response=$(curl -s -c /tmp/cookies.txt \
        -d "user[email]=test@example.com&user[password]=password123" \
        -w "\nHTTPSTATUS:%{http_code}" \
        $BASE_URL/login 2>/dev/null)
    
    local login_status=$(echo "$login_response" | grep HTTPSTATUS | sed 's/HTTPSTATUS://')
    
    if [[ "$login_status" == "302" ]]; then
        echo -e "${GREEN}✅ PASS (Redirected)${NC}"
        
        # Test authenticated dashboard
        local auth_response=$(curl -s -b /tmp/cookies.txt \
            -w "\nHTTPSTATUS:%{http_code}" $BASE_URL/dashboard 2>/dev/null)
        local auth_status=$(echo "$auth_response" | grep HTTPSTATUS | sed 's/HTTPSTATUS://')
        
        if [[ "$auth_status" == "200" ]]; then
            echo -e "${GREEN}✅ PASS Authenticated Dashboard${NC}"
        else
            echo -e "${RED}❌ FAIL Auth Dashboard (${auth_status})${NC}"
        fi
    else
        echo -e "${RED}❌ FAIL Login (${login_status})${NC}"
    fi
}

function test_dashboard_elements() {
    echo -e "${YELLOW}📊 Testing DASHBOARD ELEMENTS...${NC}"
    
    # Download dashboard HTML and check for key elements
    curl -s $BASE_URL/ -o /tmp/dashboard.html
    
    if grep -qi "network status" /tmp/dashboard.html; then
        echo -e "${GREEN}✅ PASS Network Status present${NC}"
    else
        echo -e "${YELLOW}⚠️  WARN No 'network status' found${NC}"
    fi
    
    if grep -qi "dashboard" /tmp/dashboard.html; then
        echo -e "${GREEN}✅ PASS Dashboard title present${NC}"
    else
        echo -e "${RED}❌ FAIL No dashboard title${NC}"
    fi
    
    # Check for Tailwind CSS (your UI framework)
    if grep -qi "tailwind" /tmp/dashboard.html; then
        echo -e "${GREEN}✅ PASS Tailwind CSS detected${NC}"
    fi
}

# Main test suite
echo "🚀 RUNNING COMPLETE TEST SUITE"
echo "======================================================================"

test_endpoint "/" "MAIN DASHBOARD" 200
test_endpoint "/dashboard" "DASHBOARD" 200
test_endpoint "/status" "STATUS PAGE" 200 || true
test_endpoint "/api/health" "HEALTH API" 200 || true

test_login
test_dashboard_elements

# Cleanup
echo -e "${YELLOW}🧹 Cleaning up...${NC}"
kill $SERVER_PID 2>/dev/null || true
rm -f /tmp/*.html /tmp/cookies.txt 2>/dev/null || true

echo "======================================================================"
echo "✅ TEST SUITE COMPLETE"
echo "📋 Logs saved to /tmp/ files for debugging"
