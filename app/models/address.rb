class Address < ApplicationRecord
  belongs_to :user

  validates :postcode, presence: true
  validates :prefecture_name, presence: true
  validates :address, presence: true

  def view_address
    '〒' + postcode.to_s + address_city + address_street + address_building + name
  end

end
