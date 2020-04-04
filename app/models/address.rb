class Address < ApplicationRecord
  belongs_to :user

  def view_address
    '〒' + postcode.to_s + address_city + address_street + address_building + name
  end

end
