FactoryGirl.define do
  factory :item do
    name Faker::StarWars.quote
    user
  end
end
