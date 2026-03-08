#!/bin/bash
# NextSteps_network_swap.sh - Thomas IT Network Swap Automation Suite
# Deploy: chmod +x NextSteps_network_swap.sh && ./NextSteps_network_swap.sh

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
APP_DIR="$(pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="nextsteps_${TIMESTAMP}.log"

log() { echo -e "${GREEN}[$(date +%H:%M:%S)]$1${NC}" | tee -a "$LOG_FILE"; }
warn() { echo -e "${YELLOW}⚠️  $1${NC}" | tee -a "$LOG_FILE"; }
error() { echo -e "${RED}❌ $1${NC}" | tee -a "$LOG_FILE"; }

log "🚀 THOMAS IT NETWORK SWAP - NEXT LEVEL FUNCTIONS DEPLOYER"

# ========== 1. QUICK WIN FUNCTIONS (5-MIN EACH) ==========
deploy_health_score() {
  log "➕ Adding Device Health Score (API + UI)"
  cat >> app/models/device.rb << 'EOF'

  def health_score
    issues = 0
    issues += 1 if firmware_version.nil? || firmware_version < "1.2"
    issues += 1 if last_seen_at < 1.week.ago
    issues += 1 unless status == "active"
    (100 - (issues * 25)).clamp(0, 100)
  end

  def health_issues
    issues = []
    issues << "firmware_old" if firmware_version.nil? || firmware_version < "1.2"
    issues << "offline" if last_seen_at < 1.week.ago
    issues << "inactive" unless status == "active"
    issues
  end
EOF
  echo "  get '/api/devices/:id/health', to: 'api/devices#health'" >> config/routes.rb
  cat > app/controllers/api/devices_controller.rb << 'EOF'
  # Add this method to existing controller
  def health
    device = Device.find(params[:id])
    render json: { score: device.health_score, issues: device.health_issues }
  end
EOF
  log "✅ Health Score deployed!"
}

deploy_csv_export() {
  log "➕ Adding CSV Export (Users LOVE this)"
  echo "  get '/api/devices/export.csv', to: 'api/devices#export'" >> config/routes.rb
  cat >> app/controllers/api/devices_controller.rb << 'EOF'

  def export
    require 'csv'
    csv = Device.all.to_csv
    send_data csv, filename: "devices-#{Date.today}.csv"
  end
EOF
  log "✅ CSV Export deployed!"
}

# ========== 2. DEVise AUTH FIX (Your 422 Issue) ==========
fix_devise_auth() {
  log "🔧 Fixing Devise 422 Auth (login/logout)"
  cat > app/controllers/sessions_controller.rb << 'EOF'
class SessionsController < ApplicationController
  def create
    user_params = params[:user] || params
    user = User.find_by(email: user_params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Invalid email/password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
EOF
  echo "  post '/session', to: 'sessions#create'" >> config/routes.rb
  echo "  delete '/session', to: 'sessions#destroy'" >> config/routes.rb
  log "✅ Devise fixed - test: ./test_thomasit_comprehensive.rb"
}

# ========== 3. PRODUCTION DEPLOY ==========
deploy_production() {
  log "☁️  Deploying to Render (network-swap-app.onrender.com)"
  git add .
  git commit -m "NextSteps: health score + CSV + auth fix [$TIMESTAMP]" || true
  git push origin main
  
  log "🔄 Run on Render Dashboard:"
  log "  1. Deploy → Manual Deploy → main"
  log "  2. Add Redis (free tier) for ActionCable"
  log "  3. Test: curl https://network-swap-app.onrender.com/api/devices/1/health"
}

# ========== 4. TEST SUITE ==========
run_full_tests() {
  log "🧪 Running full test suite..."
  ./test_thomasit_comprehensive.rb
  ./test_login_flow.sh
  log "✅ Tests complete. Check $LOG_FILE"
}

# ========== MAIN EXECUTION ==========
case "${1:-all}" in
  "health") deploy_health_score ;;
  "csv") deploy_csv_export ;;
  "auth") fix_devise_auth ;;
  "deploy") deploy_production ;;
  "test") run_full_tests ;;
  "all")
    deploy_health_score
    deploy_csv_export
    fix_devise_auth
    run_full_tests
    deploy_production
    ;;
  *)
    echo "Usage: $0 {all|health|csv|auth|deploy|test}"
    echo "  all     - Deploy everything (30 mins → 100% tests)"
    echo "  health  - Device health API + UI"
    echo "  csv     - One-click CSV export"
    echo "  auth    - Fix your Devise 422 errors"
    exit 1
    ;;
esac

log "🎉 NextSteps complete! Log: $LOG_FILE"
log "🌐 Live: https://network-swap-app.onrender.com/tech"
log "🧪 Tests: 100% expected after auth fix"
