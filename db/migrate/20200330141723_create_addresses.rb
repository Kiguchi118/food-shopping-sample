class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.integer :postcode
      t.string :prefecture_name
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.string :name

      t.timestamps
    end
  end
end
