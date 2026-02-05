#!/bin/bash
URL="https://network-swap-app-final.onrender.com"
echo "🚀 THOMAS IT DEPLOY CHECKLIST"
echo "1. Test local: ruby app.rb"
echo "2. Git commit & push"
echo "3. Wait 45s..."
sleep 45
thomas-status
./test_network_swap.sh
firefox "$URL/dashboard"
