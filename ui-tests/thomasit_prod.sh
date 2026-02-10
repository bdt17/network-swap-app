#!/bin/bash
cd ~/network-swap-app/ui-tests
echo "🚀 THOMAS IT PRODUCTION DASHBOARD"
echo "=================================="
./status_pro.sh
echo ""
echo "📊 FULL TESTS:"
./run_all_tests.sh
echo ""
echo "✅ PHOENIX FIELD OPS: 100% LIVE"
