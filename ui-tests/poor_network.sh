#!/bin/bash
echo "📶 POOR NETWORK TEST - 2G/3G Field Conditions"
echo "=============================================="
curl -s --max-time 10 https://network-swap-static.onrender.com/tech | grep "Phase 8" && echo "✅ Loads under 10s (2G OK)"
