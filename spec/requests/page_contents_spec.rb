require 'rails_helper'

RSpec.describe "PageContents", type: :request do
  let(:user) { create(:user, :admin, password: "password") }

  describe "POST /update" do
    before do
      [ "あいさつ", "予約", "お知らせ", "注意" ].each do |head|
        create(:page_content, display_page: "home", head: head, contents: [])
      end

      [ "船の紹介", "船長の紹介" ].each do |head|
        create(:page_content, display_page: "ship", head: head, contents: [])
      end

      [ "表の見方", "予約" ].each do |head|
        create(:page_content, display_page: "schedule", head: head, contents: [])
      end

      post session_url, params: { email_address: user.email_address, password: 'password' }
    end

    context '正常なパラメータを送信した場合' do
      it "contentsが書き換わること" do
        post page_contents_update_path, params: { page_content_id: PageContent.first.id, head: PageContent.first.head, contents: "aaaaa,bbbbb,ccccc" }
        expect(PageContent.first.contents).to eq [ "aaaaa", "bbbbb", "ccccc" ]
      end
    end

    context '無効なパラメータを送信した場合' do
      it "contentsが変更されないこと" do
        post page_contents_update_path, params: { page_content_id: PageContent.first.id, head: PageContent.first.head, contents: "aaaaa, bbbbb, #{'c' * 101}" }
        expect(PageContent.first.contents).to eq []
      end
    end
  end
end
