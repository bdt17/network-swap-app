#!/bin/bash
URL="https://network-swap-app-final.onrender.com"
echo "🖌️ Testing Thomas IT CSS Styling..."
curl -s "$URL/css/thomas-it.css" | head -5 | grep -i "root\|blue"
echo "✅ CSS endpoint: $(curl -s -I "$URL/css/thomas-it.css" | grep HTTP | awk '{print $2}')"
