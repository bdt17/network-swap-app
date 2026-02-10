require 'rails_helper'

RSpec.describe "Dispatches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/dispatch/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /assign_tech" do
    it "returns http success" do
      get "/dispatch/assign_tech"
      expect(response).to have_http_status(:success)
    end
  end

end
