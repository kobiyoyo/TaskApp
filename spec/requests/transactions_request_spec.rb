require 'rails_helper'

RSpec.describe "Transactions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/transactions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/transactions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/transactions/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/transactions/show"
      expect(response).to have_http_status(:success)
    end
  end

end
