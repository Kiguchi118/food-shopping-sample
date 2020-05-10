class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true
  validates :prefecture_name, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  has_many :items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :likes
  has_many :like_items, through: :likes, source: :item
  has_many :comments

  include JpPrefecture
  jp_prefecture :prefecture_code
  
  acts_as_paranoid
end
