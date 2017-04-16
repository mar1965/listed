require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:@user) { create(:user, email: Faker::Internet.email) }
  let(:@item) { create(:item, user: @user) }

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @item = FactoryGirl.create(:item, user: @user)
  end

  describe "POST create" do

    it "increments item by 1" do
      expect{post :create, user_id: @user.id, item: {name: Faker::StarWars.quote, user_id: 1}}.to change(Item,:count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, user_id: @user.id, item: {name: Faker::StarWars.quote, user_id: 1}
      expect(assigns(:item)).to eq Item.first
    end

    it "redirects to the user show view" do
      expect(response).to have_http_status(:success)
    end
  end
end
