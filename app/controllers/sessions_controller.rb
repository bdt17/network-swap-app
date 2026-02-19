class SessionsController < Devise::SessionsController
  layout false  # Login page has its own complete HTML
end
