require 'rails_helper'

RSpec.describe "Micropots", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/micropots/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/micropots/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
