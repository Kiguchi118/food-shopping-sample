class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :postcode
      t.string :prefecture_name
      t.string :address
      t.string :name
      t.integer :order_status, default: 0
      t.integer :payment_method
      t.integer :shipping_cost, default: 800
      t.integer :total_payment

      t.timestamps
    end
  end
end
