require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:@user) { create(:user, email: "listed@email.com") }

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET show" do

    before do
      get :show, {id: user.id, email: user.email}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      expect(response).to render_template :show
    end
  end

end
