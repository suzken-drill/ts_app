class AddColumnAdmin < ActiveRecord::Migration[5.2]
  def up
  	add_column :admins, :name, :string, mull: false, default: 'admin'
  end
  def down
  	remove_column :admins, :name, :string
  end
end
