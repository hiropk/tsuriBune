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

RSpec.describe "/menus", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Menu. As you add validations to Menu, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

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
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested menu" do
        menu = Menu.create! valid_attributes
        patch menu_url(menu), params: { menu: new_attributes }
        menu.reload
        skip("Add assertions for updated state")
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
