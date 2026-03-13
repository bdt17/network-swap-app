#!/bin/bash
echo "🖥️  PHARMA TRANSPORT - FRONTEND TEST SUITE v3.0 (ENTERPRISE)"
echo "================================================================================="

BASE_URL="https://network-swap-app.onrender.com"
TESTS=0
PASS=0

test_page() {
  local url=$1
  local name=$2
  local expected_title=$3
  
  ((TESTS++))
  echo -n "Testing $name... "
  
  status=$(curl -s -o /tmp/response.html -w "%{http_code}" "$url")
  title=$(grep -i "<title.*>.*</title>" /tmp/response.html 2>/dev/null | sed 's/.*>\(.*\)<.*/\1/' | tr -d '\n ' | head -1)
  
  if [[ $status == "200" ]]; then
    echo "✅ $status"
    ((PASS++))
  else
    echo "✗ $status"
  fi
}

test_page "$BASE_URL/" "Home" "Thomas"
test_page "$BASE_URL/tech" "Tech Dashboard" "Tech"
test_page "$BASE_URL/dashboard" "Main Dashboard" "Devices"
test_page "$BASE_URL/ar" "AR Glasses" "A-Frame"

echo "================================================================================="
printf "✅ FRONTEND: %d/%d (%.0f%%)\n" $PASS $TESTS $(echo "scale=0; $PASS/$TESTS*100/1" | bc -l 2>/dev/null || echo "N/A")
