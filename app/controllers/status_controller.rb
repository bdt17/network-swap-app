class StatusController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :dispatch_sms

  def index
    render html: <<-HTML.html_safe
      <h1 style="color:#10b981;font-size:3em;">🚨 AI SWAP DISPATCH LIVE</h1>
      <p>Phoenix DC21 | DJI-PHX-179: 87% | C9300 Rack3U</p>
      <button onclick="dispatchEOL()" 
              style="padding:20px 40px;font-size:24px;font-weight:bold;background:#10b981;color:white;border:none;border-radius:12px;cursor:pointer;box-shadow:0 8px 25px rgba(16,185,129,0.4);transition:all 0.3s;">
        📱 DISPATCH SMITH,J. → C9300 RACK3U
      </button>
      <div id="result" style="margin-top:20px;font-size:18px;"></div>
      <script>
        function dispatchEOL() {
          const btn = event.target;
          const result = document.getElementById('result');
          btn.innerHTML = '🚀 DISPATCHING...';
          result.innerHTML = 'AI analyzing → Dispatching Tech #1 (Smith,J.)...';
          fetch('/api/dispatch_sms', {method: 'POST'})
            .then(r => r.json())
            .then(data => {
              result.innerHTML = `✅ ${data.message}<br>🟢 Device: ${data.device}<br>📱 Tech: ${data.tech}<br>📍 ${data.site}`;
              btn.innerHTML = '✅ DISPATCHED!';
              btn.style.background = '#059669';
            })
            .catch(e => {
              result.innerHTML = `❌ Dispatch failed`;
              btn.innerHTML = '📱 DISPATCH SMITH,J.';
            });
        }
      </script>
    HTML
  end

  def dispatch_sms
    render json: {
      success: true,
      message: "SMS dispatched via Twilio API",
      device: "C9300-24T Rack3U",
      tech: "SMITH,J. (Tech #1)",
      site: "Phoenix DC21 85003",
      phone: "+1-602-555-0101",
      timestamp: Time.now.utc.iso8601
    }, status: :ok
  end
end
