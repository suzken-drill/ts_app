class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.references :parent, null: false, default: 0

      t.timestamps
    end
    #add_foreign_key :categories, :categories, column: :parent_id
  end
end
