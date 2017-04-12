require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user, email: "listmaker@mail.com") }
  let(:item) { Item.create!(name: "Finish up Bloc", user_id: user.id) }

  describe "attributes" do
    it "has name attribute" do
      expect(item).to have_attributes(name: "Finish up Bloc", user_id: user.id)
    end
  end
end
