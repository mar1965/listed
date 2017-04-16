FactoryGirl.define do
  factory :item do
    name Faker::StarWars.droid
    user
  end
end
