require 'faker'

# Create Users
5.times do

User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
end
users = User.all

# Create To Do Items
25.times do
  Item.create!(
    name: Faker::StarWars.quote,
    user: users.sample
  )
end

puts "Finished seeding"
puts "#{User.count} users created"
puts "#{Item.count} to do items created"
