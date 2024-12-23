require 'rails_helper'

RSpec.describe "/menus", type: :request do
  describe "ログイン済の場合" do
    let(:valid_attributes) {
      {
        name: "メニューA",
        embarkation_type: :ride_share,
        unit_price: 13000,
        acceptable_num: 4,
        payment_method: :cash_only
      }
    }

    let(:invalid_attributes) {
      {
        name: "メニューB",
        embarkation_type: :charter,
        unit_price: -13000,
        acceptable_num: 4,
        payment_method: :cashless
      }
    }

    before do
      user = create(:user, :admin, password: "password")
      post session_url, params: { email_address: user.email_address, password: 'password' }
    end

    describe "GET /index" do
      it "renders a successful response" do
        Menu.create! valid_attributes
        get menus_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        menu = Menu.create! valid_attributes
        get menu_url(menu)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_menu_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a successful response" do
        menu = Menu.create! valid_attributes
        get edit_menu_url(menu)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Menu" do
          expect {
            post menus_url, params: { menu: valid_attributes }
          }.to change(Menu, :count).by(1)
        end

        it "redirects to the created menu" do
          post menus_url, params: { menu: valid_attributes }
          expect(response).to redirect_to(menu_url(Menu.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Menu" do
          expect {
            post menus_url, params: { menu: invalid_attributes }
          }.to change(Menu, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post menus_url, params: { menu: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {
            name: "メニューA",
            embarkation_type: :ride_share,
            unit_price: 15000,
            acceptable_num: 5,
            payment_method: :cash_only
          }
        }

        it "updates the requested menu" do
          menu = Menu.create! valid_attributes
          patch menu_url(menu), params: { menu: new_attributes }
          menu.reload
          expect(menu.unit_price).to eq 15000
        end

        it "redirects to the menu" do
          menu = Menu.create! valid_attributes
          patch menu_url(menu), params: { menu: new_attributes }
          menu.reload
          expect(response).to redirect_to(menu_url(menu))
        end
      end

      context "with invalid parameters" do
        it "renders a response with 422 status (i.e. to display the 'edit' template)" do
          menu = Menu.create! valid_attributes
          patch menu_url(menu), params: { menu: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested menu" do
        menu = Menu.create! valid_attributes
        expect {
          delete menu_url(menu)
        }.to change(Menu, :count).by(-1)
      end

      it "redirects to the menus list" do
        menu = Menu.create! valid_attributes
        delete menu_url(menu)
        expect(response).to redirect_to(menus_url)
      end
    end
  end

  describe "未ログインの場合" do
    context "メニュー編集画面を表示したとき" do
      it "リダイレクトされること" do
        get "/menus"
        expect(response).to have_http_status(302)
      end
    end
  end
end
