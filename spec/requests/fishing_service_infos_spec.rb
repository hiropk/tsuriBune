require 'rails_helper'

RSpec.describe "FishingServiceInfos", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/fishing_service_infos/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/fishing_service_infos/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/fishing_service_infos/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/fishing_service_infos/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
