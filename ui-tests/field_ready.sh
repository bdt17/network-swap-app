#!/bin/bash
echo "📱 PHOENIX FIELD TECH STATUS"
echo "================================"
curl -s https://network-swap-static.onrender.com/tech | grep -E "(Phase 8|CLAIM|Site 21)" | head -3
echo "✅ MOBILE DASHBOARD LIVE - Phase 8"
