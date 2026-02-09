require 'rails_helper'

RSpec.describe "Api::Swaps", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/swaps/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/swaps/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /bulk_create" do
    it "returns http success" do
      get "/api/swaps/bulk_create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/swaps/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/swaps/update"
      expect(response).to have_http_status(:success)
    end
  end

end
