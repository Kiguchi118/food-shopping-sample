# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##### 管理者 #####
Admin.create!(
   name: 'testtest',
   email: 'test@t',
   password: 'tttttt'
)

##### ユーザー #####
gimei = Gimei.name
address = Faker::Address
User.create!(
   name: gimei.kanji,
   email: 'a@a',
   password: 'aaaaaa',
   last_name: gimei.last.hiragana,
   first_name: gimei.first.hiragana,
   last_name_kana: gimei.last.katakana,
   first_name_kana: gimei.first.katakana,
   postcode: address.postcode,
   prefecture_name: address.state,
   address: address.city,
   telephone_number: '080-0303-1221'
)

49.times do |n|
   gimei = Gimei.name
   address = Faker::Address
   User.create!(
      name: gimei.kanji,
      email: Faker::Internet.email,
      password: 'aaaaaa',
      last_name: gimei.last.hiragana,
      first_name: gimei.first.hiragana,
      last_name_kana: gimei.last.katakana,
      first_name_kana: gimei.first.katakana,
      postcode: address.postcode,
      prefecture_name: address.state,
      address: address.city,
      telephone_number: "0#{n}0-#{n+10}03-#{n+18}21"
   )
end

##### ジャンル #####
Genre.create!(name: '和食')
Genre.create!(name: 'アジア料理')
Genre.create!(name: 'ヨーロッパ料理')
Genre.create!(name: '肉料理')
Genre.create!(name: '鍋料理')
Genre.create!(name: 'スイーツ')


##### 商品 #####
50.times do |n|
   food = Faker::Food
   Item.create(
      genre_id: rand(1..5),
      name: food.dish,
      introduction: food.description,
      price: rand(1..10) * 100,
      sales_status: true
   )
end

Item.create!(
   genre_id: 6,
   name: "チョコレートケーキ",
   introduction: "甘くて美味しいチョコケーキ！",
   picture: open("#{Rails.root}/app/assets/images/img1.jpg"),
   price: 500,
   sales_status: true
)
Item.create!(
   genre_id: 6,
   name: "抹茶プリン",
   introduction: "甘くて美味しい抹茶プリン！",
   picture: open("#{Rails.root}/app/assets/images/img2.jpg"),
   price: 250,
   sales_status: true
)
