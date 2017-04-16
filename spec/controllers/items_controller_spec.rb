require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:@user) { create(:user, email: "listeduser@email.com") }
  let(:@item) { create(:item, user: @user) }

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @item = FactoryGirl.create(:item, user: @user)
  end

  describe "POST create" do

    it "increments item by 1" do
      expect{post :create, item: {name: Faker::StarWars.quote, email: "listeduser@email.com"}}.to change(Item,:count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, item: {name: Faker::StarWars.quote, email: "listeduser@email.com"}
      expect(assigns(:item)).to eq Item.first
    end

    it "renders the user show view" do
      expect(response).to redirect_to
    end
  end
end
