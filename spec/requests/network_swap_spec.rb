require "rails_helper"

RSpec.describe "Network Swap App", type: :request do
  describe "Phase 4 MVP endpoints" do
    it "returns OK for root" do
      get "/"
      expect(response).to have_http_status(:success)
    end
    
    it "returns health check HTML" do
      get "/health"
      expect(response.body).to include("Network Swap App Healthy")
    end
    
    it "returns dashboard" do
      get "/dashboard"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Network Swap")
    end
  end
end
