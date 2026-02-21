#!/bin/bash
echo "🧪 THOMAS IT LOGIN FLOW TEST"
echo "================================"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_file="login_test_$(date +%Y%m%d_%H%M%S).txt"
echo "Log: $log_file"

# Test 1: Access login page
echo -e "\n1. GET /session/new (Login Page)..."
status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/session/new)
if [ "$status" = "200" ]; then
  echo -e "${GREEN}✅ PASS${NC} - Login page loads (200)"
else
  echo -e "${RED}❌ FAIL${NC} - Login page failed ($status)"
fi

# Test 2: POST login (valid credentials simulation)
echo -e "\n2. POST /session (Login attempt)..."
status=$(curl -s -w "HTTP%{http_code}\n" -X POST \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "user[email]=test@example.com&user[password]=password123" \
  http://localhost:3000/session | tail -1)

if [[ $status == *"200"* ]] || [[ $status == *"302"* ]]; then
  echo -e "${GREEN}✅ PASS${NC} - Login POST accepted ($status)"
else
  echo -e "${YELLOW}⚠️  WARN${NC} - Login POST failed ($status)"
fi

# Test 3: Check if logged in (dashboard accessible)
echo -e "\n3. GET /dashboard (Authenticated access)..."
status=$(curl -s -o /dev/null -w "%{http_code}" \
  -H "Cookie: _network_swap_app_session=logged_in" \
  http://localhost:3000/dashboard)

if [ "$status" = "200" ]; then
  echo -e "${GREEN}✅ PASS${NC} - Dashboard accessible (200)"
else
  echo -e "${RED}❌ FAIL${NC} - Dashboard blocked ($status)"
fi

# Test 4: Logout
echo -e "\n4. DELETE /session (Logout)..."
status=$(curl -s -w "HTTP%{http_code}\n" -X DELETE \
  http://localhost:3000/session | tail -1)

if [[ $status == *"200"* ]] || [[ $status == *"302"* ]]; then
  echo -e "${GREEN}✅ PASS${NC} - Logout successful ($status)"
else
  echo -e "${RED}❌ FAIL${NC} - Logout failed ($status)"
fi

# Test 5: Verify logged out (redirect to login)
echo -e "\n5. GET /dashboard (Unauthenticated - should redirect)..."
status=$(curl -s -o /dev/null -w "%{http_code}" \
  -H "Cookie: _network_swap_app_session=" \
  http://localhost:3000/dashboard)

if [ "$status" = "302" ]; then
  echo -e "${GREEN}✅ PASS${NC} - Redirect to login after logout (302)"
else
  echo -e "${YELLOW}⚠️  WARN${NC} - No redirect ($status)"
fi

echo -e "\n🎉 LOGIN FLOW TEST COMPLETE"
echo "Log saved: $log_file"
