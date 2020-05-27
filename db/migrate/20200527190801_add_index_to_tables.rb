class AddIndexToTables < ActiveRecord::Migration[5.1]
  def change
    rename_column :categories, :name, :title
    add_index :categories, :title, unique: true
    add_index :users, :email, unique: true
    add_index :tests, %i[title difficulty], unique: true
  end
end
