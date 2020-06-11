class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string, null: false
    remove_column :users, :password, if_exists: true
    change_column :users, :role, :integer, default: 0
  end
end
