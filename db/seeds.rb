# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#regular Users Seed
@number = 20

@champions = ['Support Jungler',
  'HEART F STEEL',
  'Yikeru',
  'WRDN',
  'ivern to rank 1',
  'holyphoenix fan',
  'EMENES',
  'Shending LP',
  'Odysseus131',
  'Cheatersunited',
  'GAL Elramir',
  't4rzan1',
  'WatchMyPuppets',
  'IAimToMisbehave',
  'noway2u',
  'Robính00D',
  'hovno z kose',
  'Elite500',
  'Blake Hotz',
  'solomaker',
  'TECH NOIR',
  'WntFindMeLolPros',
  'RGO Odi11',
  'Mike Wazοwski',
  'darkchri99',
  'GW Stormax',
  'papi oscαr',
  'Schuhbart',
  'Kldfar',
  'Darlik1',
  'Sunflοwer',
  'Princess Kuba',
  'Rychly',
  'SUP Ksaez',
  'Benben',
  'Babus',
  'Rirua',
  'eiforya',
  'Mental Himalaya',
  'Envy Carry',
  '7Lovers',
  'GO CloudMaker',
  'Stor Olle',
  'Zergsting',
  'Nothing Compares',
  'Sebekx',
  'TPAA Eyhro',
  'Jeg Elsker Faxe',
  'autépé140',
  'Chongus',
  'AØH']

@icone_profile_id = [
4668,
909,
3897,
3150,
4982,
4881,
23,
4621,
4249,
3584,
29,
4653,
4838,
7,
268,
4087,
3150,
4271,
4496,
3150,
4983,
29,
4450,
4570,
1149,
3889,
4027,
1589,
3186,
2098,
7,
4570,
1625,
693,
745,
4078,
22,
22,
3226,
1387,
4942,
4878,
23,
27,
4881,
4213,
4986,
4780,
20,
4572,
3838
]

#@champion_icon_profile_id = Hash[@champions.zip(@icone_profile_id.map(&:to_i))]

@descriptions = [
  "Moi ce que j'aime, c'est trouver des gens stylés, qui ne quittent pas à la première difficulté", 
  "Viens me rejoindre, on va tout donner ! ", 
  "Marre des haters, je viens cherche des gamers sympathique qui ne vont pas me souhaiter le cancer quand je ferai des erreurs.",
  "Même si j'ai des rôles privilégiés, je suis ouvert pour tester de nouvelles configurations ! N'hésitez pas à me swiper! ",
  "Je recherche des joueurs avec un niveau similaire, question de digger un peu" 
 ]

lol_roles = ["Top-lane", "Mid-lane", "Bot-lane Support", "Bot-lane ADC", "Jungle"]
1.times do |i|
  user = User.create!(
    email: "admin@jungler.com",
    password: "azerty",
    summoner_name:@champions[i] ,
    user_game_stat_id: i+1,
    primary_role: lol_roles.sample,
    secondary_role: lol_roles.sample,
    description: "Coucou, on est l'équipe de Jungler, valide notre profil pour échanger avec nous ! :)",
    tag_list: ["Peer-Gaming", "Relax", "Try-Hard"].sample,
    icon_profile_id: @icone_profile_id[i]
  ) 
end
lol_roles = ["Top-lane", "Mid-lane", "Bot-lane Support", "Bot-lane ADC", "Jungle"]
@number.times do |i|
  user = User.create!(
    email: Faker::Internet.email,
    password: "0123456789",
    summoner_name: @champions[i+1],
    user_game_stat_id: i+2,
    tag_list: ["Peer-Gaming", "Relax", "Try-Hard"].sample,
    primary_role: lol_roles.sample,
    secondary_role: lol_roles.sample,
    description: @descriptions.sample,
    icon_profile_id:@icone_profile_id[i+1]
  ) 
end

#user tests without summoner_name to simulate incomplete profile


champions =[266,103,84,12,32,34,1,523,22,136,268,432,53,63,201,51,164,69,31,42,122,131,119,36,245,60,28,81,9,114,105,3,41,86,150,79,104,887,120,74,420,39,427,40,59,24,126,202,222,145,429,43,30,38,55,10,141,85,121,203,240,96,7,64,89,876,127,236,117,99,54,90,57,11,21,62,82,25,267,75,111,518,76,56,20,2,61,516,80,78,555,246,133,497,33,421,526,58,107,92,68,13,360,113,235,147,875,35,98,102,27,14,15,72,37,16,50,517,134,223,163,91,44,17,412,18,48,23,4,29,77,6,110,67,45,161,254,234,112,8,106,19,498,101,5,157,777,83,350,154,238,115,26,142,143]

(@number+1).times do |i|
  @first_champion_id = champions.sample
  @second_champion_id = champions.sample
  @third_champion_id = champions.sample

  user_game_stats = UserGameStat.create!(
    user_id: i+1,
    level: Faker::Number.between(from: 1, to: 500),
    summoner_id: Faker::Lorem.characters(number: 63),
    first_champion_id: @first_champion_id,
    first_champion_level: Faker::Number.between(from: 5, to: 7),
    first_champion_name: CHAMPIONS.fetch(@first_champion_id),
    second_champion_id: @second_champion_id,
    second_champion_level: Faker::Number.between(from: 3, to: 7),
    second_champion_name: CHAMPIONS.fetch(@second_champion_id),
    third_champion_id: @third_champion_id,
    third_champion_level: Faker::Number.between(from: 1, to: 7),
    third_champion_name: CHAMPIONS.fetch(@third_champion_id)
  )
end

@number.times do 
  match = Match.create!(
    requestor_id: Faker::Number.between(from: 2, to:(@number+1)),
    receiver_id: 1,
    users_tag_list: ["Peer-Gaming", "Relax", "Try-Hard"].sample,
    status: Faker::Boolean.boolean
  )
end

#1.times do 
#  conversation = Conversation.create!(
#    participant_a_id: 1,
#    participant_b_id: 2,
#  )
#end#

#10.times do 
#  message = Message.create!(
#    conversation_id: 1,
#    user_id: Faker::Number.between(from: 1, to: 2),
#    content: Faker::Lorem.sentence(word_count:2)
#  )
#end