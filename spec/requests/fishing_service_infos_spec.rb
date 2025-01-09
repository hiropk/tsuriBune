require 'rails_helper'

RSpec.describe "FishingServiceInfos", type: :request do
  let(:valid_attributes) {
    {
      name: "船長A",
      pref: "shimane",
      number: 1234,
      registration_start_date: Time.zone.today,
      registration_end_date: Time.zone.today + 10.year,
      address: "xx県xx市xx町123-54",
      ship_name: "遊漁船A",
      administrator: [ "船長A", "船長B", "船長C" ],
      insurance_start_date: Time.zone.today,
      insurance_end_date: Time.zone.today.next_year
    }
  }

  describe "ログイン済の場合" do
    before do
      user = create(:user, :admin, password: "password")
      post session_url, params: { email_address: user.email_address, password: 'password' }
    end

    describe "GET /show" do
      it "renders a successful response" do
        fishing_service_info = FishingServiceInfo.create! valid_attributes
        get fishing_service_info_url(fishing_service_info)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        fishing_service_info = FishingServiceInfo.create! valid_attributes
        get edit_fishing_service_info_url(fishing_service_info)
        expect(response).to be_successful
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {
            name: "船長B"
          }
        }

        it "updates the requested menu" do
          fishing_service_info = FishingServiceInfo.create! valid_attributes
          patch fishing_service_info_url(fishing_service_info), params: { fishing_service_info: new_attributes }
          fishing_service_info.reload
          expect(fishing_service_info.name).to eq "船長B"
        end

        it "redirects to the menu" do
          fishing_service_info = FishingServiceInfo.create! valid_attributes
          patch fishing_service_info_url(fishing_service_info), params: { fishing_service_info: new_attributes }
          fishing_service_info.reload
          expect(response).to redirect_to(fishing_service_info_url(fishing_service_info))
        end
      end

      context "with invalid parameters" do
        let(:invalid_registration_date) {
          {
            registration_start_date: Time.zone.today + 10.year,
            registration_end_date: Time.zone.today
          }
        }

        let(:invalid_insurance_date) {
          {
            insurance_start_date: Time.zone.today.next_year,
            insurance_end_date: Time.zone.today
          }
        }

        it "登録の開始日が終了日以降の場合にエラーになること" do
          fishing_service_info = FishingServiceInfo.create! valid_attributes
          patch fishing_service_info_url(fishing_service_info), params: { fishing_service_info: invalid_insurance_date }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "賠償期間の開始日が終了日以降の場合にエラーになること" do
          fishing_service_info = FishingServiceInfo.create! valid_attributes
          patch fishing_service_info_url(fishing_service_info), params: { fishing_service_info: invalid_insurance_date }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "未ログインの場合" do
    context "メニュー編集画面を表示したとき" do
      it "リダイレクトされること" do
        fishing_service_info = FishingServiceInfo.create! valid_attributes
        get fishing_service_info_url(fishing_service_info)
        expect(response).to have_http_status(302)
      end
    end
  end
end
