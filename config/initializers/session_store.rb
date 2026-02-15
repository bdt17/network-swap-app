# Use cookies to store session data (secure + works immediately)
Rails.application.config.session_store :cookie_store, 
  key: '_network_swap_session',
  expire_after: 24.hours
