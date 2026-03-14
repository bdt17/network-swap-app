#!/bin/bash
BASE_URL="https://network-swap-app.onrender.com"
echo "🚀 THOMAS IT - CONTENT VALIDATION TEST SUITE"

# Test 1: Frontend Pages (Expect HTML + Tailwind)
echo "🖥️  FRONTEND CONTENT TEST..."
for page in "" "/tech" "/dashboard" "/ar"; do
  echo -n "Testing $page... "
  CONTENT=$(curl -s "$BASE_URL$page")
  if [[ $CONTENT == *"tailwind"* || $CONTENT == *"div class="* || $CONTENT =~ "<html" ]]; then
    echo "✅ HTML+Tailwind OK ($(echo $CONTENT | wc -c) bytes)"
  else  
    echo "❌ WHITE PAGE ($(echo $CONTENT | wc -c) bytes)"
  fi
done

# Test 2: DJI APIs (Expect JSON)
echo -n "\n🚁 DJI API JSON TEST... "
FLEET=$(curl -s "$BASE_URL/api/drones/fleet")
if [[ $FLEET == *"DJI-PHX-179"* ]]; then
  echo "✅ DJI Fleet JSON OK"
else
  echo "❌ Fleet API failed"
fi

# Test 3: Param Routes (Expect valid JSON)
echo -n "Testing /api/drones/1/inspect... "
INSPECT=$(curl -s "$BASE_URL/api/drones/1/inspect")
if [[ $INSPECT == *"PASS"* ]]; then
  echo "✅ Inspect JSON OK"
else
  echo "❌ Inspect 500"
fi

echo "✅ CONTENT TESTS COMPLETE"
