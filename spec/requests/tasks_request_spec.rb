require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/tasks/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/tasks/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/tasks/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/tasks/index"
      expect(response).to have_http_status(:success)
    end
  end

end
