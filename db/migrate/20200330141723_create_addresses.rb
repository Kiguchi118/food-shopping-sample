class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.integer :postcode
      t.string :prefecture_name
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
