class CreateItemCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :item_category_relations do |t|
      t.references :item, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
