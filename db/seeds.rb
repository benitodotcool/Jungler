# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#regular Users Seed
# 1.times do |i|
#   user = User.create!(
#     email: "admin@jungler.com",
#     password: "azerty",
#     summoner_name: Faker::Superhero.name,
#     user_game_stat_id: i+1,
#     tag_list: ["Peer-Learning", "Relax", "Try-Hard"].sample
#   ) 
# end

20.times do |i|
  user = User.create!(
    email: Faker::Internet.email,
    password: "0123456789",
    summoner_name: Faker::Superhero.name,
    user_game_stat_id: i+2,
    tag_list: ["Peer-Learning", "Relax", "Try-Hard"].sample
  ) 
end

#user tests without summoner_name to simulate incomplete profile


lol_roles = ["Top-lane", "Mid-lane", "Bot-lane Support", "Bot-lane ADC", "Jungle"]

20.times do |i|
  user_game_stats = UserGameStat.create!(
    user_id: i+1,
    level: Faker::Number.between(from: 1, to: 3099),
    summoner_id: Faker::Lorem.characters(number: 63),
    primary_role: lol_roles.sample,
    secondary_role: lol_roles.sample,
    description: Faker::Lorem.sentence(word_count:10)
  )
end

20.times do 
  match = Match.create!(
    requestor_id: Faker::Number.between(from: 1, to: 17),
    receiver_id: 1,
    status: Faker::Boolean.boolean
  )
end

1.times do 
  conversation = Conversation.create!(
    participant_a_id: 1,
    participant_b_id: 2,
  )
end

10.times do 
  message = Message.create!(
    conversation_id: 1,
    user_id: Faker::Number.between(from: 1, to: 2),
    content: Faker::Lorem.sentence(word_count:10)
  
  )
end