require 'rails_helper'

RSpec.describe "Micropots", type: :request do
  let(:user) { create(:user, :admin, password: "password") }

  describe "POST /create" do
    subject { post(micropots_create_path, params: { micropost: { content: "hello_turiBune" } }) }

    before do
      post session_url, params: { email_address: user.email_address, password: 'password' }
    end

    context "正常なパラメータを送信した場合" do
      it "該当のレコードが1件増えること" do
        expect { subject }.to change(Micropost, :count).by(1)
        target_content = Micropost.find_by(user: user).content
        expect(target_content).to eq "hello_turiBune"
      end
    end

    context "無効なパラメータを送信した場合" do
      subject { post(micropots_create_path, params: { micropost: { content: nil } }) }

      it "Micropostモデルのレコードが増えないこと" do
        expect { subject }.to change(Micropost, :count).by(0)
      end
    end
  end

  describe "POST /destroy" do
    let!(:micropost) { create(:micropost, user: user) }
    subject { post(micropots_destroy_path, params: { id: micropost.id }) }

    before do
      post session_url, params: { email_address: user.email_address, password: 'password' }
    end

    context "正常なパラメータを送信した場合" do
      it "該当のレコードが1件削除されること" do
        expect { subject }.to change(Micropost, :count).by(-1)
      end
    end
  end
end
