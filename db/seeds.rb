# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#regular Users Seed
17.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "0123456789",
    summoner_name: Faker::Superhero.name
  ) 
end

#user tests without summoner_name to simulate incomplete profile
3.times do |i|
  user = User.create!(
    email: "incomplete@profile#{i}.net",
    password: "0123456789"
  )
end
