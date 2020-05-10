class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :name
      t.text :introduction
      t.string :picture
      t.integer :price
      t.boolean :sales_status

      t.timestamps
    end
  end
end
