# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#regular Users Seed
1.times do |i|
  user = User.create!(
    email: "admin@jungler.com",
    password: "azerty",
    summoner_name: Faker::Superhero.name,
    user_game_stat_id: i+1
  ) 
end
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
champions =[266,103,84,12,32,34,1,523,22,136,268,432,53,63,201,51,164,69,31,42,122,131,119,36,245,60,28,81,9,114,105,3,41,86,150,79,104,887,120,74,420,39,427,40,59,24,126,202,222,145,429,43,30,38,55,10,141,85,121,203,240,96,7,64,89,876,127,236,117,99,54,90,57,11,21,62,82,25,267,75,111,518,76,56,20,2,61,516,80,78,555,246,133,497,33,421,526,58,107,92,68,13,360,113,235,147,875,35,98,102,27,14,15,72,37,16,50,517,134,223,163,91,44,17,412,18,48,23,4,29,77,6,110,67,45,161,254,234,112,8,106,19,498,101,5,157,777,83,350,154,238,115,26,142,143]

21.times do |i|
  @first_champion_id = champions.sample
  @second_champion_id = champions.sample
  @third_champion_id = champions.sample

  user_game_stats = UserGameStat.create!(
    user_id: i+1,
    level: Faker::Number.between(from: 1, to: 3099),
    summoner_id: Faker::Lorem.characters(number: 63),
    primary_role: lol_roles.sample,
    secondary_role: lol_roles.sample,
    description: Faker::Lorem.sentence(word_count:10),
    first_champion_id: @first_champion_id,
    first_champion_level: Faker::Number.between(from: 1, to: 7),
    first_champion_name: CHAMPIONS.fetch(@first_champion_id),
    second_champion_id: @second_champion_id,
    second_champion_level: Faker::Number.between(from: 1, to: 7),
    second_champion_name: CHAMPIONS.fetch(@second_champion_id),
    third_champion_id: @third_champion_id,
    third_champion_level: Faker::Number.between(from: 1, to: 7),
    third_champion_name: CHAMPIONS.fetch(@third_champion_id)
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