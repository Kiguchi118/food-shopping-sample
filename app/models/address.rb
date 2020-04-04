class Address < ApplicationRecord
  belongs_to :user

  def view_address
    '〒' + self.postcode.to_s + self.address_city + self.address_street + self.address_building + self.name
  end

end
