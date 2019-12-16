class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :item, foreign_key: true
      t.string :item_number, null: false
      t.integer :stock

      t.timestamps
    end
    add_index :stocks, :item_number, unique: true
  end
end
