require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, email: "listeduser@email.com" ) }

  # Shoulda tests for email
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("listeduser@email.com").for(:email) }

  # Shoulda tests for encrypted password
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should have an email" do
      expect(user).to have_attributes(email: user.email)
    end

    it "responds to email" do
      expect(user).to respond_to(:email)
    end
  end
end
