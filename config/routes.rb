Rails.application.routes.draw do
  # NUCLEAR OPTION: Rails built-in health check ONLY
  get "/*", to: "rails/health#show"
end
