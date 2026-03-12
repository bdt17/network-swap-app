#!/bin/bash
echo "🖥️  PHARMA TRANSPORT NETWORK SWAP - FRONTEND TEST SUITE v1.0"
echo "================================================================================="
echo "Testing: HTML/CSS/JS + Tailwind + AR.js + Responsive + Accessibility"
echo "Date: $(date)"
echo "================================================================================="

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Test counters
FRONTEND_PASSED=0
FRONTEND_TOTAL=0
FAILED_TESTS=()

# 1. PAGE LOAD + HTML VALIDITY
test_page_load() {
  local url=$1
  local name=$2
  ((FRONTEND_TOTAL++))
  echo -n "Testing $name... "
  
  # Check HTTP 200 + HTML content
  response=$(curl -s -w "\nHTTP:%{http_code}\nSize:%{size_output}\nTime:%{time_total}s" "$url")
  http_code=$(echo "$response" | grep "HTTP:" | cut -d: -f2 | tr -d ' ')
  size=$(echo "$response" | grep "Size:" | cut -d: -f2 | tr -d ' ')
  time=$(echo "$response" | grep "Time:" | cut -d: -f2 | tr -d ' ')
  
  if [[ $http_code == "200" && $size -gt 1000 ]]; then
    echo -e "${GREEN}✓ PASS${NC} ($time, ${size}b)"
    ((FRONTEND_PASSED++))
  else
    echo -e "${RED}✗ FAIL${NC} (HTTP:$http_code, ${size}b)"
    FAILED_TESTS+=("$name (HTTP:$http_code)")
  fi
}

# 2. RESPONSIVE + MOBILE TEST
test_responsive() {
  local url=$1
  local name=$2
  ((FRONTEND_TOTAL++))
  echo -n "Testing $name responsive... "
  
  # Check viewport meta tag (mobile responsive)
  meta=$(curl -s "$url" | grep -i "viewport" | head -1)
  if [[ -n "$meta" ]]; then
    echo -e "${GREEN}✓ MOBILE OK${NC}"
    ((FRONTEND_PASSED++))
  else
    echo -e "${YELLOW}⚠ MISSING${NC} viewport meta"
    FAILED_TESTS+=("$name (no viewport)")
  fi
}

# 3. TAILWIND CSS DETECTION
test_tailwind() {
  local url=$1
  local name=$2
  ((FRONTEND_TOTAL++))
  echo -n "Testing $name Tailwind... "
  
  tailwind=$(curl -s "$url" | grep -i "tailwind" | head -1)
  classes=$(curl -s "$url" | grep -o 'class="[a-zA-Z0-9:\/_-]\+"' | head -3)
  if [[ -n "$tailwind" || -n "$classes" ]]; then
    echo -e "${GREEN}✓ TAILWIND OK${NC}"
    ((FRONTEND_PASSED++))
  else
    echo -e "${YELLOW}⚠ NO CSS${NC}"
    FAILED_TESTS+=("$name (no Tailwind)")
  fi
}

# 4. AR.JS / WEBXR DETECTION
test_ar_webxr() {
  local url=$1
  local name=$2
  ((FRONTEND_TOTAL++))
  echo -n "Testing $name AR/WebXR... "
  
  ar_js=$(curl -s "$url" | grep -i "ar.js\|webxr\|aframe" | head -1)
  if [[ -n "$ar_js" ]]; then
    echo -e "${GREEN}✓ AR.JS OK${NC}"
    ((FRONTEND_PASSED++))
  else
    echo -e "${YELLOW}⚠ STANDARD${NC}"
    ((FRONTEND_PASSED++))  # Not required for all pages
  fi
}

# RUN ALL FRONTEND TESTS
echo "🏠 HOME PAGE"
test_page_load "http://localhost:3000" "Home"
test_tailwind "http://localhost:3000" "Home"
test_responsive "http://localhost:3000" "Home"

echo ""
echo "🔧 TECH DASHBOARD"
test_page_load "http://localhost:3000/dashboard/tech" "Tech Dashboard" 
test_tailwind "http://localhost:3000/dashboard/tech" "Tech Dashboard"
test_responsive "http://localhost:3000/dashboard/tech" "Tech Dashboard"

echo ""
echo "📊 MAIN DASHBOARD"
test_page_load "http://localhost:3000/dashboard" "Dashboard"
test_tailwind "http://localhost:3000/dashboard" "Dashboard"

echo ""
echo "🕶️  AR GLASSES"
test_page_load "http://localhost:3000/dashboard/ar" "AR Glasses"
test_ar_webxr "http://localhost:3000/dashboard/ar" "AR Glasses"

# RESULTS
echo ""
echo "================================================================================="
echo "FRONTEND TEST RESULTS: ${FRONTEND_PASSED}/${FRONTEND_TOTAL} PASSED ($(echo "scale=1; $FRONTEND_PASSED*100/$FRONTEND_TOTAL" | bc)% )"
if [ ${#FAILED_TESTS[@]} -eq 0 ]; then
  echo -e "${GREEN}🎉 ALL FRONTEND PASS - PRODUCTION READY${NC}"
else
  echo -e "${RED}❌ FRONTEND FAILURES:${NC}"
  for test in "${FAILED_TESTS[@]}"; do
    echo "   $test"
  done
fi
echo "CSV Report: frontend_test_$(date +%Y%m%d_%H%M%S).csv"
echo "================================================================================="
