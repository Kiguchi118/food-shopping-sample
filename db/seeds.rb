# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   name: 'testtest',
   email: 'test@t',
   password: 'tttttt'
)

User.create!(
   name: 'exa',
   email: 'a@a.com',
   password: 'aaaaaa',
   last_name: 'exa',
   first_name: 'aaa',
   last_name_kana: 'exa',
   first_name_kana: 'aaa',
   postcode: 1000004,
   prefecture_name: '東京都',
   address_city: '千代田区',
   address_street: '大手町123-4',
   address_building: 'オオテマチ',
   telephone_number: '08012120000'
)

Genre.create!(name: 'ケーキ')
Genre.create!(name: 'プリン')
Genre.create!(name: '焼き菓子')
Genre.create!(name: 'キャンディ')

Item.create!(
   genre_id: 1,
   name: "チョコレートケーキ",
   introduction: "甘くて美味しいチョコケーキ！",
   # picture: open("#{Rails.root}/db/fixtures/img1.jpg"),
   price: 500,
   sales_status: true
)
Item.create!(
   genre_id: 2,
   name: "抹茶プリン",
   introduction: "甘くて美味しい抹茶プリン！",
   # picture: open("#{Rails.root}/db/fixtures/img2.jpg"),
   price: 250,
   sales_status: true
)
