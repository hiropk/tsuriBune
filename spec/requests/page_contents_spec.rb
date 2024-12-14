require 'rails_helper'

RSpec.describe "PageContents", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/page_contents/update"
      expect(response).to have_http_status(:success)
    end
  end

end
