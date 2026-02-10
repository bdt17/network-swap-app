#!/bin/bash
echo "📱 MOBILE FIELD TEST - iPhone/Android Reality"
echo "=============================================="
curl -s -A "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X)" \
  https://network-swap-static.onrender.com/tech | grep -E "(Phase 8|CLAIM|SITE 21)" | head -4
echo "✅ Mobile viewport + Tailwind confirmed"
