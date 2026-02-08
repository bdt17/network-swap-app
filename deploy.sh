#!/bin/bash
echo "🚀 DEPLOY PHASE 4-14"
git add .
git commit -m "Quick wins: $(date)"
git push origin main
echo "✅ Render deploying... check in 2 mins"
sleep 2
curl https://network-swap-app.onrender.com/api/status
