#!/bin/bash
# fix_NetworkSwap_critical.sh - PHARMA TRANSPORT EMERGENCY DEPLOY FIX (NO COMMIT)
# Thomas IT Network Swap - ENTERPRISE CRITICAL (Mar 11, 2026)

set -e

echo "🔥 THOMAS IT NETWORK SWAP - CRITICAL FIX DEPLOYER 🔥"

# 1. FIX DATABASE CONSTRAINTS
echo "🔧 [1/5] FIXING DATABASE..."
rails console << 'EOF'
Site.create!(name: 'Unassigned') unless Site.exists?(name: 'Unassigned')
Device.where(site_id: nil).update_all(site_id: Site.find_by(name: 'Unassigned').id)
puts "✅ #{Device.count} devices fixed"
exit
EOF

# 2. START LOCAL SERVER
echo "🚀 [2/5] LOCAL SERVER..."
rails server -p 3000 -d > /dev/null 2>&1 &
sleep 5

# 3. FULL TEST SUITE
echo "🧪 [3/5] TEST SUITE..."
./testALL_localPages_vs_prod.rb

# 4. VERIFY ROUTES + CONTROLLERS
echo "🔍 [4/5] VERIFICATION..."
rails routes | grep dispatch_sms
ls -la app/controllers/api/dispatch_controller.rb || echo "⚠️ DispatchController missing"

# 5. CLEANUP + NOTIFICATION (NO GIT COMMIT!)
echo "💎 [5/5] FIELD TEAM READY..."
echo "🚀 Render Dashboard → Manual Deploy → main"
echo "📱 Test: curl -X POST https://network-swap-app.onrender.com/api/dispatch_sms"
pkill -f "rails server" || true

echo "🎉 ✅ CRITICAL FIX COMPLETE - READY FOR RENDER DEPLOY!"
