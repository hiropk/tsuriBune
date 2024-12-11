require 'rails_helper'

RSpec.describe "ShipCaptains", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/ship_captain/home"
      expect(response).to have_http_status(:success)
    end
  end

end
