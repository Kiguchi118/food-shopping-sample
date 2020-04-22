##### 管理者 #####
Admin.create!(
   name: "testtest",
   email: "test@t",
   password: "tttttt"
)

##### ユーザー #####
User.create!(
   name: "テストユーザ",
   email: "test@example.com",
   password: "aaaaaa",
   last_name: "山田",
   first_name: "太郎",
   last_name_kana: "ヤマダ",
   first_name_kana: "タロウ",
   postcode: 1234567,
   prefecture_name: "テスト県",
   address: "テスト市",
   telephone_number: "999-9999-9999"
)
29.times do |n|
   gimei = Gimei.name
   address = Faker::Address
   User.create!(
      name: gimei.kanji,
      email: Faker::Internet.email,
      password: "aaaaaa",
      last_name: gimei.last.kanji,
      first_name: gimei.first.kanji,
      last_name_kana: gimei.last.katakana,
      first_name_kana: gimei.first.katakana,
      postcode: address.postcode,
      prefecture_name: address.state,
      address: address.city,
      telephone_number: "0#{n}-#{n+10}-#{n+18}"
   )
end

##### ジャンル #####
Genre.create!(name: "和食")
Genre.create!(name: "アジア料理")
Genre.create!(name: "ヨーロッパ料理")
Genre.create!(name: "肉料理")
Genre.create!(name: "鍋料理")
Genre.create!(name: "スイーツ")


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
