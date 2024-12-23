require 'rails_helper'

RSpec.describe "ShipCaptains", type: :request do
  describe "ログイン済の場合" do
    before do
      user = create(:user, :admin, password: "password")
      post session_url, params: { email_address: user.email_address, password: 'password' }
    end

    context "船長管理画面を表示したとき" do
      it "ホーム画面が表示されること" do
        get "/ship_captain/home"
        expect(response).to have_http_status(200)
      end

      it "ページ編集画面が表示されること" do
        get "/ship_captain/page_edit"
        expect(response).to have_http_status(200)
      end

      it "メニュー画面が表示されること" do
        get "/menus"
        expect(response).to have_http_status(200)
      end

      it "遊漁船情報編集画面が表示されること" do
        get "/ship_captain/fishing_service_info_edit"
        expect(response).to have_http_status(200)
      end

      it "スケジュール画面が表示されること" do
        get "/ship_captain/schedule_edit"
        expect(response).to have_http_status(200)
      end

      it "リンク画面が表示されること" do
        get "/ship_captain/link_edit"
        expect(response).to have_http_status(200)
      end

      it "安全情報画面が表示されること" do
        get "/ship_captain/safety_info_edit"
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "未ログイン場合" do
    context "船長管理画面を表示したとき" do
      it "リダイレクトされること" do
        get "/ship_captain/home"
        expect(response).to have_http_status(302)
      end
    end
  end
end
