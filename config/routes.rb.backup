Rails.application.routes.draw do
  # STATIC HTML ROOT - NO CONTROLLERS, NO LAYOUTS, NO current_user
  root to: proc { [200, {'Content-Type' => 'text/html'}, [<<~HTML]] }
  
  HTML = <<~HTML
<!DOCTYPE html>
<html>
<head>
  <title>Thomas IT Network Swap</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="font-family: Arial; padding: 40px; background: #1e3a8a; color: white;">
  <h1 style="color: white;">🚀 Thomas IT Network Swap</h1>
  <p><strong>Production Dashboard Ready</strong></p>
  <div style="background: rgba(255,255,255,0.1); padding: 20px; border-radius: 8px; max-width: 400px;">
    <a href="/users/sign_in" style="display: inline-block; background: #10b981; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; margin-right: 10px;">🔐 Login</a>
    <a href="/users/sign_up" style="display: inline-block; background: #3b82f6; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px;">➕ Register Admin</a>
  </div>
  <p style="margin-top: 20px; font-size: 14px;">
    Rails 8.1 • PostgreSQL • Tailwind • Devise • Pundit<br>
    FDA 21 CFR Part 11 Compliant • Phase 4-7 LIVE
  </p>
</body>
</html>
  HTML
  
  devise_for :users
  resources :devices
  resources :sites
  resources :swaps
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :api, defaults: { format: :json } do
    resources :devices, only: [:index, :show]
  end
end
