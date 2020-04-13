class Address < ApplicationRecord
  belongs_to :user

  validates :postcode, presence: true
  validates :prefecture_name, presence: true
  validates :address, presence: true

  def view_address
    "〒#{postcode.to_s} #{prefecture_name} #{address} #{name}様"
  end

end
