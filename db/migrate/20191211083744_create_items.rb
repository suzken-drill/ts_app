class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_number, null: false
      t.string :title, null: false
      t.integer :price, null: false
      t.text :content
      t.text :content_simple
      t.string :image_url
      t.datetime :sale_start_at
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5
      t.string :image_6
      t.integer :wholesale_price
      t.integer :postage
      t.string :include_division
      t.string :packing_size
      t.integer :shipment_from
      t.integer :shipment_to
      t.integer :strick_price
      t.integer :lower_price

      t.timestamps
    end
    add_index :items, :item_number, unique: true
  end
end
