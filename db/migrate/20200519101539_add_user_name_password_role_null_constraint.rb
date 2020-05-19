class AddUserNamePasswordRoleNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :role, false)
  end
end
