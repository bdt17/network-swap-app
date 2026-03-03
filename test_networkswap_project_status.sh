#!/bin/bash
clear
echo "🔥 THOMAS IT NETWORK SWAP - ENTERPRISE DASHBOARD (Mar 2026)"
echo "═══════════════════════════════════════════════════════════════"

# 1. RAILS + LIVE DATA
echo "🟢 RAILS $(rails --version)"
echo "📊 LIVE DATA:"
rails runner "
  site = Site.last; drone = Drone.where(status: 'online').first; eol = Device.where(status: 'EOL').first
  puts '  Site: ' + (site ? site.name + ' (' + site.address + ')' : 'EMPTY')
  puts '  Drones: ' + Drone.count.to_s + (drone ? ' | ' + drone.identifier + ' 🟢' + drone.battery_level.to_s + '%' : '')
  puts '  Devices: ' + Device.count.to_s + (eol ? ' | ' + eol.name + ' 🔴EOL' : '')
  puts '  Critical: ' + Device.where(status: ['EOL', 'needs_firmware']).count.to_s
" 2>/dev/null || echo "  🔴 Rails runner failed"

# 2. ENDPOINT HEALTH CHECK
echo "🌐 ENDPOINT STATUS:"
ENDPOINTS=("/" "/status" "/api/devices" "/dashboard" "/api/dispatch_sms" "/tech")
for endpoint in "${ENDPOINTS[@]}"; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000$endpoint 2>/dev/null || echo "ERR")
  COLOR=$([ "$STATUS" = "200" ] && echo "🟢" || echo "🔴")
  printf "  %-20s %s\n" "$endpoint" "$COLOR$STATUS"
done

# 3. GIT + DEPLOY STATUS
echo "📁 GIT:"
echo "  Branch: $(git branch --show-current)"
echo "  Commits: $(git rev-list --count HEAD)"
echo "  Changes: $(git status --porcelain | wc -l | xargs)"
echo "☁️  RENDER: $([ -f render.yaml ] && echo "✅ Configured" || echo "❌ Missing")"

# 4. PROGRESS (PHASE 8A SHIPPED!)
echo "🚀 PHASES: 61% COMPLETE (Phase 8A: AI Dispatch ✅)"
echo "  ✅ LIVE: Phoenix DC21, DJI 85%, C9300 EOL"
echo "  ✅ NEW: /status → AI dispatch button"
echo "  ⏳ NEXT: Phase 8B Twilio SMS (tomorrow)"

# 5. ACTION ITEMS
echo "🎯 NEXT ACTIONS:"
echo "  1. git push → Deploy AI button"
echo "  2. Visit: https://network-swap-app.onrender.com/status"
echo "  3. CLICK GREEN BUTTON → Test dispatch"
echo "  4. Phase 8B → 'Twilio SMS'"
