# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   name: 'testtest',
   email: 'test@test.com',
   password: 'testtest'
)

User.create(
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
