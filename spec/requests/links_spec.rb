require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/links", type: :request do
  describe "ログイン済の場合" do
    let(:valid_attributes) {
      {
        name: "リンクA",
        url: "https://familiar.onrender.com/",
        description: "遊漁船ファミリアのホームページ"
      }
    }

    let(:invalid_attributes) {
      {
        name: "リンクB",
        url: "無効なURL",
        description: "長すぎる説明"*30
      }
    }

    before do
      user = create(:user, :admin, password: "password")
      create(:fishing_service_info)
      post session_url, params: { email_address: user.email_address, password: 'password' }
    end

    describe "GET /index" do
      it "renders a successful response" do
        Link.create! valid_attributes
        get links_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        link = Link.create! valid_attributes
        get link_url(link)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_link_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        link = Link.create! valid_attributes
        get edit_link_url(link)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Link" do
          expect {
            post links_url, params: { link: valid_attributes }
          }.to change(Link, :count).by(1)
        end

        it "redirects to the created link" do
          post links_url, params: { link: valid_attributes }
          expect(response).to redirect_to(link_url(Link.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Link" do
          expect {
            post links_url, params: { link: invalid_attributes }
          }.to change(Link, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post links_url, params: { link: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {
            name: "リンクC",
            url: "https://familiar.onrender.com/hello",
            description: "遊漁船ファミリアのホームページを更新しました。"
          }
        }

        it "updates the requested link" do
          link = Link.create! valid_attributes
          patch link_url(link), params: { link: new_attributes }
          link.reload
          expect(link.name).to eq "リンクC"
          expect(link.url).to eq "https://familiar.onrender.com/hello"
          expect(link.description).to eq "遊漁船ファミリアのホームページを更新しました。"
        end

        it "redirects to the link" do
          link = Link.create! valid_attributes
          patch link_url(link), params: { link: new_attributes }
          link.reload
          expect(response).to redirect_to(link_url(link))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          link = Link.create! valid_attributes
          patch link_url(link), params: { link: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested link" do
        link = Link.create! valid_attributes
        expect {
          delete link_url(link)
        }.to change(Link, :count).by(-1)
      end

      it "redirects to the links list" do
        link = Link.create! valid_attributes
        delete link_url(link)
        expect(response).to redirect_to(links_url)
      end
    end
  end

  describe "未ログインの場合" do
    context "メニュー編集画面を表示したとき" do
      it "リダイレクトされること" do
        get "/links"
        expect(response).to have_http_status(302)
      end
    end
  end
end
