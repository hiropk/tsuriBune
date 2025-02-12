require 'rails_helper'

RSpec.describe "/schedules", type: :request do
  describe "ログイン済の場合" do
    let!(:menu) { create(:menu, acceptable_num: 5) }

    let(:valid_attributes) {
      {
        menu_id: menu.id,
        num_reservation: 4,
        memo: "",
        start_time: DateTime.current
      }
    }

    let(:invalid_attributes) {
      {
        menu_id: menu.id,
        num_reservation: menu.acceptable_num + 1,
        memo: "",
        start_time: nil
      }
    }

    before do
      user = create(:user, :admin, password: "password")
      create(:fishing_service_info)
      post session_url, params: { email_address: user.email_address, password: 'password' }
    end

    describe "GET /index" do
      it "renders a successful response" do
        Schedule.create! valid_attributes
        get schedules_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        schedule =  Schedule.create! valid_attributes
        get schedule_url(schedule)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_schedule_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        schedule = Schedule.create! valid_attributes
        get edit_schedule_url(schedule)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Schedule" do
          expect {
            post schedules_url, params: { schedule: valid_attributes }
          }.to change(Schedule, :count).by(1)
        end
      end

      context "with invalid parameters" do
        it "does not create a new Schedule" do
          expect {
            post schedules_url, params: { schedule: invalid_attributes }
          }.to change(Schedule, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post schedules_url, params: { schedule: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {
            num_reservation: 5,
            memo: "メモを更新"
          }
        }

        it "updates the requested schedule" do
          schedule = Schedule.create! valid_attributes
          patch schedule_url(schedule), params: { schedule: new_attributes }
          schedule.reload
          expect(schedule.num_reservation).to eq 5
          expect(schedule.memo).to eq "メモを更新"
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          schedule = Schedule.create! valid_attributes
          patch schedule_url(schedule), params: { schedule: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested schedule" do
        schedule = Schedule.create! valid_attributes
        expect {
          delete schedule_url(schedule)
        }.to change(Schedule, :count).by(-1)
      end

      it "redirects to the schedules list" do
        schedule = Schedule.create! valid_attributes
        delete schedule_url(schedule)
        expect(response).to redirect_to(schedules_url)
      end
    end
  end

  describe "未ログインの場合" do
    context "メニュー編集画面を表示したとき" do
      it "リダイレクトされること" do
        get "/schedules"
        expect(response).to have_http_status(302)
      end
    end
  end
end
