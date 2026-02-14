class DashboardController < ApplicationController
  def index
    if user_signed_in?
      render html: <<~HTML
        <!DOCTYPE html>
        <html><head><title>Tech #<%= current_user.tech_id %></title>
        <style>body{margin:0;padding:40px;background:linear-gradient(135deg,#0984C0 0%,#60BDD1 100%);color:#565759;font-family:-apple-system,sans-serif;min-height:100vh;}
        .card{max-width:600px;margin:0 auto;background:rgba(255,255,255,0.95);padding:40px;border-radius:20px;border:1px solid #AAA7B0;box-shadow:0 20px 40px rgba(9,132,192,0.3);}
        h1{color:#0984C0;font-size:2.5rem;margin-bottom:20px;}
        .tickets{background:#C0BEC6;padding:20px;border-radius:12px;margin:20px 0;}
        .btn{background:#0984C0;color:white;padding:12px 24px;border:none;border-radius:8px;font-size:1rem;cursor:pointer;text-decoration:none;display:inline-block;margin:5px;}
        .btn:hover{background:#60BDD1;}</style></head>
        <body>
          <div class="card">
            <h1>🛠️ Tech Dashboard #<%= current_user.tech_id %></h1>
            <p>✅ Welcome <%= current_user.email %> - Phase 13 LIVE</p>
            <div class="tickets">
              <h3>📱 Active Tickets:</h3>
              <div>🔴 PHX-DC1: Cisco-2960-24TT (Critical)</div>
              <div>🟡 DEN-DC1: Aruba-AP-305 (High)</div>
            </div>
            <%= link_to "🔄 Refresh", root_path, class: "btn" %>
            <%= link_to "🚪 Logout", destroy_user_session_path, data: {turbo_method: :delete}, class: "btn" %>
          </div>
        </body></html>
      HTML
    else
      render html: <<~HTML
        <!DOCTYPE html>
        <html><head><title>Thomas IT Network Swap</title>
        <style>body{margin:0;padding:40px;background:linear-gradient(135deg,#0984C0 0%,#60BDD1 100%);color:#565759;font-family:-apple-system,sans-serif;min-height:100vh;}
        .card{max-width:500px;margin:0 auto;background:rgba(255,255,255,0.95);padding:40px;border-radius:20px;border:1px solid #AAA7B0;box-shadow:0 20px 40px rgba(9,132,192,0.3);}
        h1{color:#0984C0;font-size:2.5rem;margin-bottom:10px;}
        .btn{background:#0984C0;color:white;padding:15px 30px;border:none;border-radius:10px;font-size:1.1rem;cursor:pointer;width:100%;margin-top:20px;text-decoration:none;display:block;text-align:center;}
        .btn:hover{background:#60BDD1;}
        .demo{background:#C0BEC6;padding:12px;border-radius:8px;font-family:monospace;font-size:14px;margin-top:20px;}</style></head>
        <body><div class="card"><h1>🔐 Thomas IT Network Swap</h1><p><strong>Phase 13 Production</strong></p>
        <a href="/users/sign_in" class="btn">🚀 Tech Login</a>
        <div class="demo">tech@thomasit.com<br>Smith2001!</div></div></body></html>
      HTML
    end
  end
end
